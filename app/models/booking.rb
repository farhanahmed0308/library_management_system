class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # scope
  scope :borrowed, ->(user) { where(id: Booking.where(user_id: user.id).pluck(:book_id)) }
end


# scope :borrowed_by_user, lambda { |current_user|
#   where(id: Booking.where(user_id: current_user.id).pluck(:book_id))
# }
