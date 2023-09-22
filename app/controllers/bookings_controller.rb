class BookingsController < ApplicationController
  include BookingConcern
  before_action :authenticate_user!
  def new
    @booking = Booking.new
  end

  def booked_book
    @borrowed_books = Book.borrowed_by_user(current_user)
  end

  def create
    @book = Book.find(params[:id])
    if @book.status == 'Borrowed'
      flash[:notice] = 'already booked'
      redirect_to '/books' and return
    end
    due_date = Date.today + 1.day
    @booking = current_user.bookings.build(book_id: @book.id, due_date:)
    @booking.book.update(status: 1)
    if @booking.save
      flash[:notice] = 'Successfully booked'
      redirect_to '/books'
    else
      flash[:error] = 'Booking failed'
      redirect_to root_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @booking = current_user.bookings.where(book_id: @book.id)
    if @booking.destroy_all
      flash[:notice] = 'successfully unbooked'
      @book.update(status: 0)
      reserve = Reservation.where(book_id: @book.id, status: "active")
      a = reserve.pluck(:user_id)
      reserve_user = User.where(id: a)
      reserve_user.each do |user|
        # ReserveBookNotificationMailer.notify(user, @book).deliver_now
        # mail to user who reserve the current_borrowed book
        ReserveBookJob.perform_later(user, @book)
        reserve.update(status: "inactive")
      end
      redirect_to booked_book_path
    else
      flash[:notice] = 'failed to unbook'
    end
  end
end
