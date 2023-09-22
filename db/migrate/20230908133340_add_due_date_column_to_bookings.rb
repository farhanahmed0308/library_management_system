# frozen_string_literal: true

class AddDueDateColumnToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :due_date, :date
  end
end
