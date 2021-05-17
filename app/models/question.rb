class Question < ApplicationRecord
  has_many :answers
  validates :question, :name, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            format: { with: VALID_EMAIL_REGEX, message: 'Invalid email' },
            length: { minimum: 4, maximum: 254 }
end
