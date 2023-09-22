class Book < ApplicationRecord
  # attache pdf
  has_one_attached :pdf
  has_one_attached :front_page
  # STI
  self.inheritance_column = 'book_type'
  # associate with user
  belongs_to :user
  # associate with Booking
  has_one :booking, dependent: :destroy
  # association with Reservations
  has_one :reservation, dependent: :destroy
  validates :title, presence: true
  # add status of book
  enum status: %i[Available Borrowed Reserved Over_due]
  # ransack gem for searching books
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at author isbn type status title updated_at]
  end
  def self.ransackable_associations(_auth_object = nil)
    []
  end
  # scopes 
  scope :borrowed_by_user, lambda { |current_user|
                             where(id: Booking.where(user_id: current_user.id).pluck(:book_id))
                           }
end
