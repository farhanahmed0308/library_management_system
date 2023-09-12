class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :book
    scope :borrowed,-> (user) {where(id: Booking.where(user_id: user.id).pluck(:book_id))} 
end