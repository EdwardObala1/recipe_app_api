require 'rails_helper'

RSpec.describe User, type: :model do
  # the db exists 
  it 'checks if the DB exists' 

  describe 'it checks for associations: ' do
  it 'User has many recipes'
  it 'User has many comments'
  it 'User had many recommendations'
  end

  describe 'test to see if email,name and password can not be saved if null' do
    it 'checks if null is name is valid' do
      user = User.new(name: '', email: 'eddy@yahoo.com', password: 'password').save
      expect(user).to eq(false)
    end 
    it 'checks if email exist' do
      user = User.new(name: 'Edward', email: '', password: 'password').save
      expect(user).to eq(false)
    end 
    it 'checks if password exist' do
      user = User.new(name: 'Edward', email: 'eddy@yahoo.com', password: '').save
      expect(user).to eq(false)
    end 

    it 'If nothing is null it passes' do
      user = User.new(name: 'Edward', email: 'eddy@yahoo.com', password: 'Eddy12345').save
      expect(user).to eq(true)
    end 
  end

  describe 'Tests to validate format is met' do
    it 'makes sure that name and password meet the minimum length of 5 and 8 respectively' do
      user = User.new(name: 'Edu', email: 'eddy@yahoo.com', password: 'Eddy').save
      expect(user).to eq(false)
    end 
  
  end
end
