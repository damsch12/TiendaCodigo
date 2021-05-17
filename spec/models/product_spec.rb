require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid name' do
    product = described_class.new(description: 'Product description', price: 200)
    expect(product.valid?).to eq(false)
    expect(product.errors[:name].include?("can't be blank")).to eq(true)
    expect(product.errors[:name].include?('is too short (minimum is 10 characters)')).to eq(true)
  end

  it 'has a valid description' do
    product = described_class.new(name: 'Product name', price: 200)
    expect(product.valid?).to eq(false)
    expect(product.errors[:description].include?("can't be blank")).to eq(true)
    expect(product.errors[:description].include?('is too short (minimum is 10 characters)')).to eq(true)
  end

  it 'has a valid price' do
    product = described_class.new(name: 'Product name', description: 'Product description', price: -1)
    expect(product.valid?).to eq(false)
    expect(product.errors[:price].include?('must be greater than or equal to 0')).to eq(true)
  end
end
