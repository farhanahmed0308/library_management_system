class ReservationsController < ApplicationController
    def index
        @reservation = Reservation.where(user_id: current_user.id)
    end
    def reserve
        @book = Book.find(params[:id])
        # if Reservation.where(book_id: @book.id)
        #     flash[:error] = 'Already reserved.'
        #     redirect_to "/books" and return
        # end
        @reservations = current_user.reservations.build(book_id: @book.id)
        if @reservations.save
            flash[:notice] = 'Book reserved successfully.'
            redirect_to "/books"
        else
            flash[:error] = 'Reservation failed.'
            render 'books/show'
        end
    end

    # def reserve
    #     @book = Book.find(params[:id])
    
    #     # Check if the book is already reserved or borrowed
    #     if @book.reserved? || @book.borrowed?
    #       flash[:error] = 'Book is not available for reservation.'
    #       redirect_to @book
    #       return
    #     end
    
    #     # Create a reservation for the current user
    #     @reservation = current_user.reservations.build(book: @book)
    
    #     if @reservation.save
    #       # Mark the book as reserved
    #       @book.update(status: 'Reserved')
    
    #       flash[:success] = 'Book reserved successfully.'
    #       redirect_to @book
    #     else
    #       flash[:error] = 'Reservation failed.'
    #       render 'books/show'
    #     end
    #   end
end
