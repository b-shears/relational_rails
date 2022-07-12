require 'rails_helper'
#story_12
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
RSpec.describe 'Edit Brewery' do
  describe 'As a vistor' do
    describe 'When I vist the breweries show page' do
      it 'can link to edit brewery' do
        new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)

        visit "/breweries/#{new_belgium.id}"

        click_link "Update Brewery"

        expect(current_path).to eq("/breweries/#{new_belgium.id}/edit")
      end

      it 'can update a brewery' do
        new_belgium = Brewery.create!(name: 'New Belgium Brewing', age: 31, pet_friendly: true)
        visit "/breweries/#{new_belgium.id}/edit"
        fill_in 'Name', with: 'New Belgium Brewing Company'
        fill_in 'Age', with: 31
        fill_in 'pet_friendly', with: true
        click_on "Update Brewery"

        expect(current_path).to eq("/breweries/#{new_belgium.id}")
        expect(page).to have_content('New Belgium Brewing Company')
      end
    end
  end
end
