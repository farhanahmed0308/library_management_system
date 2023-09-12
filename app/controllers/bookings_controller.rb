class BookingsController < ApplicationController
    include BookingConcern
    before_action :authenticate_user!
    def new
        @booking = Booking.new
    end
    def booked_book
        # @book = Book.find(params[:id])
        # a = Booking.where(user_id: current_user.id).pluck(:book_id)
        # b = a.pluck(:book_id)
        # @borrowed_books = Book.where(id: Booking.where(user_id: current_user.id).pluck(:book_id))
        #using scope
        @borrowed_books = Book.borrowed_by_user(current_user)
        # @borrowed_books = Book.where(user_id: current_user.id, status: "Borrowed")
        # @borrowed_books = User.borrowed_books(current_user)
    end
    def create
        @book = Book.find(params[:id])
        if @book.status == "Borrowed"
            flash[:notice] = "already booked"
            redirect_to "/books" and return
        end
        due_date = Date.today + 1.day
        @booking = current_user.bookings.build(book_id: @book.id, due_date: due_date)
        @booking.book.update(status: 1)
        if @booking.save
          flash[:notice] = "Successfully booked"
          redirect_to "/books"
        else
          flash[:error] = "Booking failed"
          redirect_to root_path
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @booking = current_user.bookings.where(book_id: @book.id)
        if @booking.destroy_all
            flash[:notice] = "successfully unbooked"
            @book.update(status: 0)
            reserve = Reservation.where(book_id: @book.id)
            a = reserve.pluck(:user_id)
            reserve_user = User.where(id: a)
            reserve_user.each do |user|
                # ReserveBookNotificationMailer.notify(user, @book).deliver_now
                ReserveBookJob.perform_later(user, @book)
            end
            redirect_to booked_book_path
        else
            flash[:notice] = "failed to unbook"
        end
    end
end