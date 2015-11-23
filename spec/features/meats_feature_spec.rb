require 'rails_helper'

feature 'meats' do
  context 'no meats on page' do
    scenario 'should display a link for one sort of meat' do
      visit '/meats'
      expect(page).to have_link 'Chicken'
    end
  end

  context 'meats can be added' do
    before do
      Meat.create(name: 'Fish')
    end

    scenario 'display meats' do
      visit '/meats'
      expect(page).to have_content('Fish')
      expect(page).not_to have_content('Juice')
    end
  end

end
