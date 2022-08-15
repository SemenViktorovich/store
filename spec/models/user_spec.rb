# frozen_string_literal: true

require 'selenium-webdriver'
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: 'User@mail.ru', password: 'qwe!@#1') }
  let(:user_nil_email) { User.new(email: nil, password: 'qwe!@#1') }
  let(:user_nil_password) { User.new(email: 'User@mail.ru', password: nil) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    expect(user_nil_email).to_not be_valid
  end

  it 'is not valid without a password' do
    expect(user_nil_password).to_not be_valid
  end

  it 'returns name' do
    expect(user.email).to eq('User@mail.ru')
  end

  it 'returns string' do
    expect(user.email).to be_an_instance_of(String)
  end
end
