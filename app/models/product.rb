class Product < ApplicationRecord
    has_many :favourites, class_name: "Favourite", foreign_key: "product_id", dependent: :destroy
end
