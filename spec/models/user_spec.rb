require 'spec_helper'

describe 'User' do
  context 'encrypts password automatically' do
    it 'fails when hash and password and confirmation is nil' do
      u = User.new
      u.email = 'testone@test.com'
      u.save.should be_false
    end

    it 'fails when password and confirmation don\'t match' do

    end

    it 'saves when hash is not nil and password / confirmation is nil' do
      u = User.new
      u.email = 'testone@test.com'
      u.password = 'foo'
      u.password_confirmation = 'foo'
      u.save.should be_true
    end
  end
end

