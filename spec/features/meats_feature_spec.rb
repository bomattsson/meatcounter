require 'rails_helper'

feature 'meats' do
  context 'no meats on page' do
    scenario 'should display a link for one sort of meat' do
      visit '/meats'
      expect(page).to have_link 'Chicken'
    end
  end

end