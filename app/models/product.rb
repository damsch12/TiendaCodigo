class Product < ApplicationRecord
    has_many :favourites, class_name: "Favourite", foreign_key: "product_id", dependent: :destroy
    validates :name, presence: true, length: { in: 10..100 }
    validates :description, presence: true, length: { in: 10..500 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
