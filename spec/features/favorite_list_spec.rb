require 'rails_helper'

RSpec.feature 'Favorites list' do
  include Devise::Test::IntegrationHelpers
  let!(:user) { User.create!(email: 'user@example.com', password: 'password', display_name: 'User', role: nil) }
  let(:p1) { Product.create!(name: 'Product name 1', description: 'product description 1', price: 10.50) }
  let(:p2) { Product.create!(name: 'Product name 2', description: 'product description 2', price: 200.50) }

  before do
    sign_in user
    user.add_favourite(p2.id)
  end

  scenario 'add favorite' do
    visit product_path(p1)
    expect(page).to have_content('User')

    click_button 'favorite_add'

    expect(page.current_path).to eq(product_path(p1))
    expect(page).to have_selector('#favorite_remove')
  end
  
  scenario 'remove favorite' do
    visit product_path(p2)
    expect(page).to have_content('User')

    click_button 'favorite_remove'

    expect(page.current_path).to eq(product_path(p2))
    expect(page).to have_selector('#favorite_add')
  end
end
