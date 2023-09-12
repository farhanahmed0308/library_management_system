class AdminProfilesController < ApplicationController
    def profile 
        if @over_due_bookings = Booking.where('due_date<?', Date.today)
            fetch_user_id  = @over_due_bookings.pluck(:user_id)
            fetch_user = User.where(id: fetch_user_id)
            fetch_user.each do |user|
                #  OverDueBookNotificationMailer.over_due_notify(user).deliver_now
                OverDueNotificationJob.perform_later(user)
            end
            @over_due_bookings.each do |booking|
                @over_dates = (Date.today.to_date - booking.due_date.to_date).to_i
                @total_charge = @over_dates * 10
                current_user.update(balance: current_user.balance + @total_charge)
                # booking.book.update(status: 3)
            end
        end
    end
    def user_detail
      @users = User.all
    end
    def destroy_user
        # super
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/user_detail_path'
    end
end
