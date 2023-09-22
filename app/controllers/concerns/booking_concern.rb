module BookingConcern
  extend ActiveSupport::Concern

  def create_booking_and_redirect(book)
    @booking = current_user.bookings.build(book_id: book.id)
    @booking.book.update(status: 1)

    if @booking.save
      flash[:notice] = "<a href='/books'>Successfully booked</a>"
      redirect_to '/books'
    else
      flash[:error] = 'Booking failed'
      redirect_to root_path
    end
  end
end
