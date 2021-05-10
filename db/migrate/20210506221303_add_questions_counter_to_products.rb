class AddQuestionsCounterToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :questions_counter, :integer, default: 0
  end
end
