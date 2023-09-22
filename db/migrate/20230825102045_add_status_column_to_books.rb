# frozen_string_literal: true

class AddStatusColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :integer, default: 0
  end
end
