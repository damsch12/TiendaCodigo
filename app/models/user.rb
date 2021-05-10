class User < ApplicationRecord
  has_many :favourites, class_name: "Favourite", foreign_key: "user_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def add_favourite(product_id)
    prod = Product.find(product_id)
    prod.add_favourite_counter
    favourites << Favourite.new(user_id: self.id, product_id: product_id)
  end
  
  def remove_favourite(favourite)
    favourite.product.substract_favourite_counter
    favourite.product.save
    favourites.delete(favourite)
  end
  
  def favourite?(product_id)
    favourites.exists?(user_id: self.id, product_id: product_id)
  end
end
