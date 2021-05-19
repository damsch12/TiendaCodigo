# frozen_string_literal: true

# Represents a user
class User < ApplicationRecord
  has_many :favourites, class_name: 'Favourite', foreign_key: 'user_id', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def add_favourite(product_id)
    prod = Product.find(product_id)
    prod.add_favourite_counter
    favourites << Favourite.new(user_id: id, product_id: product_id)
  end

  def remove_favourite(favourite)
    favourite.product.substract_favourite_counter
    favourite.product.save
    favourites.delete(favourite)
  end

  def favourite?(product_id)
    favourites.exists?(user_id: id, product_id: product_id)
  end

  def admin?
    return false unless role.present?

    role == 'Admin'
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
  
    unless user
        user = User.create(display_name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
