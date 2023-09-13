class Book < ApplicationRecord
    has_one_attached :pdf
    has_one_attached :front_page
    self.inheritance_column = 'book_type'
    belongs_to :user
    has_one :booking, dependent: :destroy
    has_one :reservation, dependent: :destroy
    validates :title, presence: true
    enum status: [:Available, :Borrowed,:Reserved,:Over_due]

    # ransack gem for searching books
    def self.ransackable_attributes(auth_object = nil)
        ['created_at', 'author','isbn','type', 'status', 'title', 'updated_at']
    end
       
    def self.ransackable_associations(auth_object = nil)
       []
    end


    scope :borrowed_by_user, ->(current_user) do
        where(id: Booking.where(user_id: current_user.id).pluck(:book_id))
      end

end