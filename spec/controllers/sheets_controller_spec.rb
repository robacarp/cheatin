require 'spec_helper'

describe 'SheetsController' do
  it 'allows you to create a new sheet' do 
    visit '/sheets/new'
    within '#new_sheet' do
      fill_in 'sheet_title', :with => 'Foo the Bars'
      fill_in 'sheet_content', :with => 'Lorem ipsum dolor sit amet.'
      click_button 'Create Sheet'
    end

    response.should render_template('index')
    within '#flashes' do
      page.should have_content('Success')
    end
  end

  it 'does not allows you to create a new sheet if blank title' do 
    visit '/sheets/new'
    within '#new_sheet' do
      #fill_in 'sheet_title', :with => 'Foo the Bars'
      fill_in 'sheet_content', :with => 'Lorem ipsum dolor sit amet.'
      click_button 'Create Sheet'
    end

    response.should render_template('new')
    within '#flashes' do
      page.should have_content('Errors')
    end
  end
  

  it 'does not allows you to create a new sheet if blank content' do 
    visit '/sheets/new'
    within '#new_sheet' do
      fill_in 'sheet_title', :with => 'Foo the Bars'
      #fill_in 'sheet_content', :with => 'Lorem ipsum dolor sit amet.'
      click_button 'Create Sheet'
    end

    response.should render_template('new')
    within '#flashes' do
      page.should have_content('Errors')
    end
  end
end


















