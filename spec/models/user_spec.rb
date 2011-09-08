require 'spec_helper'

describe 'User' do
  context 'automatic password encryption' do
    it 'should fail when (hash and password and confirmation) is nil' do
      u = User.new
      u.email = 'testone@test.com'
      u.save.should be_false
    end

    it 'should fail when password and confirmation don\'t match' do
      u = User.new
      u.email = 'testone@test.com'
      u.password = 'foo'
      u.password_confirmation = 'bar'
      u.save.should be_false
    end

    it 'should save when hash is not nil and password / confirmation is nil' do
      u = User.new
      u.email = "testtest@test.com"
      u.password = 'foo'
      u.password_confirmation = 'foo'
      u.save

      u.email = 'new_email@test.com'
      u.save.should be_true
    end

    it 'should save when hash is nil and (password & confirmation) is not nil' do
      u = User.new
      u.email = 'testone@test.com'
      u.password = 'foo'
      u.password_confirmation = 'foo'
      u.save.should be_true
    end

    it 'should maintain a consistent salt across saves' do
      u = User.new
      first_salt = u.salt
      u.email = 'randomsnthsnthsnthaoenu@f.f'
      u.password = u.password_confirmation = 'foo'
      u.save.should be_true
      u.reload
      (u.salt == first_salt).should be_true
    end

  end
end

