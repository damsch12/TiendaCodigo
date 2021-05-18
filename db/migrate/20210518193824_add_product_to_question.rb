class AddProductToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :product, foreign_key: true
  end
end
