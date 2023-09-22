# frozen_string_literal: true

class AddTypeColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :type, :string
  end
end
