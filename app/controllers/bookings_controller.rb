class BookingsController < ApplicationController
    def new
        @booking = Booking.new
    end
    def create
        @book = Book.find(params[:id])
        @booking = current_user.bookings.build(book_id: @book.id)
        if @booking.save
            redirect_to "/books"
        else
            redirect_to root_path
        end
    end
end