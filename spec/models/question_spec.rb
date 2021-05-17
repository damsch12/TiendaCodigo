# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'has a question' do
    question = described_class.new(name: 'Damian', email: 'dscheck@codigodelsur.com')
    expect(question.valid?).to eq(false)
  end

  it 'has a name' do
    question = described_class.new(question: 'This is a question?', email: 'dscheck@codigodelsur.com')
    expect(question.valid?).to eq(false)
  end

  it 'has an email' do
    question = described_class.new(question: 'This is a question?', name: 'Damian')
    expect(question.valid?).to eq(false)
  end

  it 'has an invalid email' do
    question = described_class.new(question: 'This is a question?', name: 'Damian', email: 'dscheck')
    question.valid?
    expect(question.errors[:email].length).to eq(1)
    expect(question.errors[:email].include?('Invalid email')).to eq(true)
  end
end
