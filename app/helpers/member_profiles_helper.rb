# frozen_string_literal: true

module MemberProfilesHelper
    def calculate
        # over_due_bookings = Booking.where(user_id: current_user.id).where('due_date<?', Date.today)
        # fetch_user_id = over_due_bookings.pluck(:user_id)
        # fetch_user = User.where(id: fetch_user_id)
        # fetch_user.each do |user|
        #   #  OverDueBookNotificationMailer.over_due_notify(user).deliver_now
        #   OverDueNotificationJob.perform_later(user)
        # end
        # total_charge = 0
        # over_due_bookings.each do |booking|
        # over_dates = (Date.today.to_date - booking.due_date.to_date).to_i
        # charge_per_book = over_dates * 10
        # total_charge = total_charge + charge_per_book
        # end
        # total_charge
    end
end
