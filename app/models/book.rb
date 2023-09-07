class Book < ApplicationRecord
    has_one_attached :pdf
    self.inheritance_column = 'book_type'
    belongs_to :user
    has_one :booking
    validates :title, presence: true
    enum status: [:Available, :Borrowed,:Reserved,:In_Repair]

    # ransack gem for searching books
    def self.ransackable_attributes(auth_object = nil)
        ['created_at', 'author','isbn','type', 'status', 'title', 'updated_at']
    end
       
    def self.ransackable_associations(auth_object = nil)
       []
    end
end