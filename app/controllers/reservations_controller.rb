# frozen_string_literal: true
class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.where(user_id: current_user.id)
  end

  def reserve
    @book = Book.find(params[:id])
    @reservations = Reservation.find_or_initialize_by(book_id: @book.id, user_id: current_user.id)
    if @reservations.persisted?
      flash[:notice] = 'Book already resereved'
    else
      @reservations.save
      flash[:error] = 'Reservation successfully saved'
    end
    redirect_to books_path
  end
end
