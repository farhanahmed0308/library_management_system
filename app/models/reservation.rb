class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
    enum status: {active: 0, inactive: 1}
end
