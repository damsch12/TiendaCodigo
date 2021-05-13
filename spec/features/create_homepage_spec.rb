require "rails_helper"

RSpec.feature "Listing products in Home page" do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.new(email: 'user@example.com', password: 'password', display_name: 'User')
    @user.save
    @p1 = Product.create(name: 'Product name 1',
                         description: 'product description 1',
                         price: 10.50)
  end

  scenario "with visiting user" do
    visit "/"

    expect(page).to have_content('Product name 1')
    expect(page).to have_link('Login')
  end
  
  scenario "with logged in user" do
    sign_in @user
    visit "/"

    expect(page).to have_content('Product name 1')
    expect(page).to have_link('User')
  end
end