require 'rails_helper'

RSpec.describe User, type: :model do
  before(:context) do
    @user = User.new(email: 'dscheck@codigodelsur.com', display_name: 'Damian test', password: '123456')
    @user.save!
  end

  after(:context) do
    User.delete(@user)
  end

  it 'adds a favourite' do
    @user.add_favourite(1)
    expect(@user.favourites.length).to eq(1)
  end
  
  it 'removes a favourite' do
    @user.remove_favourite(@user.favourites.first)
    expect(@user.favourites.length).to eq(0)
  end
end
