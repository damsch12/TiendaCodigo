require "rails_helper"

RSpec.feature "Creating questions" do

  before do
    @user = User.new(email: 'user@example.com', password: 'password', display_name: 'User')
    @user.save
    @p1 = Product.create(name: 'Product name 1',
                         description: 'product description 1',
                         price: 10.50)
    @p2 = Product.create(name: 'Product name 2',
                         description: 'product description 2',
                         price: 10.50)
  end

  scenario "with visiting user" do
    visit "/"

    click_link "see_more_1"

    fill_in "Name", with: "Damian Scheck"
    fill_in "Email", with: "damsch12@gmail.com"
    fill_in "question_question", with: "This is a test question from Capybara"

    click_button "Send Question"

    expect(page).to have_content('Your question has been sucessfully submitted.')
    expect(page.current_path).to eq(product_path(@p1))
    expect(Question.count).to eq(1)
  end
  
  scenario "with logged in user" do
    login_as(@user)
    
    visit "/"
    expect(page).to have_content('User')

    click_link "see_more_2"

    expect(page).not_to have_selector('#question_name')
    expect(page).not_to have_selector('#question_email')
    fill_in "question_question", with: "This is a test question from Capybara with logged in user"

    click_button "Send Question"
    
    expect(page).to have_content('Your question has been sucessfully submitted.')
    expect(page.current_path).to eq(product_path(@p2))
    expect(Question.count).to eq(1)
  end
end