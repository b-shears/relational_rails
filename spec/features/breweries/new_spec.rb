require 'rails_helper'
#User Story 11, Parent Creation
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
RSpec.describe 'New Brewery' do
  describe 'As a visitor' do
    describe "When I visit the Brewery Index page then I see a link to create a new Brewery record, New Brewery" do
      it 'I can create a new Brewery when I click on the link' do
        visit '/breweries'
        click_link 'New Brewery'
        expect(current_path).to eq('/breweries/new')
        fill_in 'Name', with: 'The New Brewery'
        fill_in 'Age', with: 0
        fill_in 'pet_friendly', with: true
        click_on 'Create Brewery'
        expect(current_path).to eq('/breweries')
        expect(page).to have_content('The New Brewery')
      end
    end
  end
end
