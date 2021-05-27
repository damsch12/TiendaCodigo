# frozen_string_literal: true

# Represents a user question for a product
class Question < ApplicationRecord
  has_many :answers
  belongs_to :product
  validates :question, :name, :email, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid email' },
            length: { minimum: 4, maximum: 254 }
end
