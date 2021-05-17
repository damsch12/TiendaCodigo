# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create!(email: 'user@example.com', password: 'password', display_name: 'User', role: nil) }
  let!(:p1) { Product.create!(name: 'Product name 1', description: 'product description 1', price: 10.50) }

  it 'adds a favourite' do
    user.add_favourite(1)
    expect(user.favourites.length).to eq(1)
  end

  it 'removes a favourite' do
    user.add_favourite(1)
    user.remove_favourite(user.favourites.first)
    expect(user.favourites.length).to eq(0)
  end
end
