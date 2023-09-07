class BookingsController < ApplicationController
    before_action :authenticate_user!
    # before_action :check_borrowed, only: [:create]
    def new
        @booking = Booking.new
    end
    def booked_book
        
        @borrowed_books = User.borrowed_books(current_user)
    end
    def create
        @book = Book.find(params[:id])
        @booking = current_user.bookings.build(book_id: @book.id)
        @booking.book.update(status: 1)
        flash[:notice] = "successfully booked"
        if @booking.save
            redirect_to "/books"
        else
            redirect_to root_path
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @booking = current_user.bookings.where(book_id: @book.id)
        if @booking.destroy_all
            flash[:notice] = "successfully unbooked"
            @book.update(status: 0)
            redirect_to booked_book_path
        else
            flash[:notice] = "failed to unbook"
        end
    end
    private
    # def check_borrowed
    #     @book = Book.find(params[:id])
    #     if @book.where(status: "Borrowed")
    #         flash[:notice] = "already borrowed"
    #     end
    # end
end