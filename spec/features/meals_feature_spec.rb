require 'rails_helper'

feature 'meals, weekly view' do


  before do
    User.create(email: 'bo@cint.com', password: '12345678')
    visit('/')
    click_link('Sign in')
    fill_in('Email', with: 'bo@cint.com')
    fill_in('Password', with: '12345678')
    click_button('Sign in')
  end

  #before {Meat.create name: 'Venison'}
  scenario 'allows users to see a weekly view' do

    click_link 'My meat week'

    expect(current_path).to eq '/meats/weekview'
    expect(page).to have_content 'Lunch' byebug
  end


end


