# frozen_string_literal: true

class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end

    add_index :favourites, :product_id
    add_index :favourites, :user_id
    add_index :favourites, %i[product_id user_id], unique: true
  end
end
