require 'rails_helper'

feature 'meats' do
  context 'no meats on page' do
    scenario 'should display a link for adding types of meat' do
      visit '/meats'
      expect(page).to have_link 'Add new type of meat'
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

  context 'creating types of meats' do
    scenario 'prompts users to fill out a form, then displays the new sort' do
      visit '/meats'
      click_link 'Add new type of meat'
      fill_in "Name", with: 'Venison'
      click_button 'Create type of meat'
      expect(page).to have_content 'Venison'
      expect(current_path).to eq '/meats'
    end
  end

  context 'viewing specific meats' do
    let!(:venison) { Meat.create(name: 'Venison') }

    scenario 'lets a user view a specific meat type' do
      visit '/meats'
      click_link 'Venison'
      expect(page).to have_content 'Venison'
      expect(current_path).to eq "/meats/#{venison.id}"
    end
  end

  context 'editing types of meat' do

    before { @venison = Meat.create name: 'Venison' }

    scenario 'lets a user edit type of meat' do
      #visit '/meats'
      visit edit_meat_path(@venison)
      #click_link 'Edit Venison'
      fill_in 'Name', with: 'Rådjur'
      click_button 'Update Meat'
      expect(page).to have_content 'Rådjur'
      expect(current_path).to eq meat_path(@venison)
    end
  end

  context 'deleting meats' do

    before { @venison = Meat.create name: 'Venison'}

    scenario 'removes a type of meat when a user clicks a delete link' do
      visit meat_path(@venison)
      click_link 'Delete Venison'
      expect(page).not_to have_content 'Venison'
      expect(page).to have_content 'Meat deleted'
    end

  end

end
