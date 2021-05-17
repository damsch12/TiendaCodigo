class Product < ApplicationRecord
  has_many :favourites, class_name: 'Favourite', foreign_key: 'product_id', dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, length: { in: 10..100 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def add_favourite_counter
    self.favourite_counter = favourite_counter + 1
    save
  end

  def substract_favourite_counter
    self.favourite_counter = favourite_counter - 1
    save
  end

  def add_question_counter
    self.questions_counter = questions_counter + 1
    save
  end

  def substract_question_counter
    self.questions_counter = questions_counter - 1
    save
  end
end
