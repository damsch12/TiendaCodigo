require 'rails_helper'

RSpec.feature 'Creating questions' do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create!(email: 'user@example.com', password: 'password', display_name: 'User', role: nil) }
  let!(:p1) { Product.create!(name: 'Product name 1', description: 'product description 1', price: 10.50) }
  let!(:p2) { Product.create!(name: 'Product name 2', description: 'product description 2', price: 200.50) }

  scenario 'with visiting user' do
    visit '/'

    click_link 'see_more_1'

    fill_in 'Name', with: 'Damian Scheck'
    fill_in 'Email', with: 'damsch12@gmail.com'
    fill_in 'question_question', with: 'This is a test question from Capybara'

    click_button 'Send Question'

    expect(page).to have_content('Your question has been sucessfully submitted.')
    expect(page.current_path).to eq(product_path(p1))
  end

  scenario 'with logged in user' do
    sign_in user

    visit '/'
    expect(page).to have_content('User')

    click_link 'see_more_2'

    expect(page).not_to have_selector('#question_name')
    expect(page).not_to have_selector('#question_email')
    fill_in 'question_question', with: 'This is a test question from Capybara with logged in user'

    click_button 'Send Question'

    expect(page).to have_content('Your question has been sucessfully submitted.')
    expect(page.current_path).to eq(product_path(p2))
  end
end
