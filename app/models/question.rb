# frozen_string_literal: true

# Represents a user question for a product
class Question < ApplicationRecord
  has_many :answers
  belongs_to :product
  validates :question, :name, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email,
            format: { with: VALID_EMAIL_REGEX, message: 'Invalid email' },
            length: { minimum: 4, maximum: 254 }
end
