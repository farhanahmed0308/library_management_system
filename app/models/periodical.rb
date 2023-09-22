# frozen_string_literal: true

class Periodical < Book
  has_one_attached :pdf
  belongs_to :user, dependent: :destroy
end
