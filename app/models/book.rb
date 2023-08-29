class Book < ApplicationRecord
    has_one_attached :pdf
    self.inheritance_column = 'book_type'
    belongs_to :user
    validates :title, presence: true
    enum status: [:Available, :Borrowed,:Reserved,:In_Repair]
end