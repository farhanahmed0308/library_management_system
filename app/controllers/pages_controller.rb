# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def privacy; end

  def terms_of_use; end

  def benefit; end

  def faq; end
  def success_stripe
    current_user.update(balance: 0)
    over_due_bookings = Booking.where(user_id: current_user.id).where('due_date<?', Date.today)
    over_due_bookings.each do |over_due_book|
      over_due_book.book.update(status: "Available")
      over_due_book.destroy
    end
  end
end
