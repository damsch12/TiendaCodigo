# frozen_string_literal: true

class AddFavCounterToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :favourite_counter, :integer, default: 0
  end
end
