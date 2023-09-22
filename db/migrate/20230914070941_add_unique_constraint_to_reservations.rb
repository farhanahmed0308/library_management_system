# frozen_string_literal: true

class AddUniqueConstraintToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, %i[user_id book_id], unique: true
  end
end
