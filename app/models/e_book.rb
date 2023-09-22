# frozen_string_literal: true

class EBook < Book
  has_one_attached :pdf
  belongs_to :user, dependent: :destroy
end
