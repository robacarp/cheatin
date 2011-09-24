require 'spec_helper'

describe 'SessionsController' do
  before :all do
    @user = User.new :email => 'testuser55@55.com'
    @password  ='010203'
    @user.password = @password
    @user.password_confirmation = @password
    @user.save
  end

  it 'allows a user to login' do
    visit '/'
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => @password
    click_button 'Login'

    within '#flashes' do
      page.should have_content('SUCCESS');
    end
  end

  it 'prevents an invalid login' do
    visit '/'
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => @password + 'foobard1d'
    click_button 'Login'

    within '#flashes' do
      page.should have_content('Incorrect email or password');
    end
  end

  it 'prevents login with invalid email' do
    visit '/'
    fill_in 'user_email', :with => @user.email + 'durkadurkadurrrr'
    fill_in 'user_password', :with => @password
    click_button 'Login'

    within '#flashes' do
      page.should have_content('Incorrect email or password');
    end
  end

  it 'prevents login with invalid email and password' do
    visit '/'
    fill_in 'user_email', :with => @user.email + 'durkadurkadurrrr'
    fill_in 'user_password', :with => @password + 'grrr'
    click_button 'Login'

    within '#flashes' do
      page.should have_content('Incorrect email or password');
    end
  end
end
