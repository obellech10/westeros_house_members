require 'rails_helper'

# As a user
RSpec.describe 'As a user' do
  describe "When I visit the root page" do
    it 'I can see members of any house by using the dropdown menu' do
      # When I visit "/"
      visit '/'

# save_and_open_page
      # And I select "Greyjoy" from the dropdown
      # expect(page).to have_select('house', selected: 'Greyjoy')
      select 'Greyjoy', from: :house

      # And I click on "Get Members"
      click_on 'Get Members'

      # Then my path should be "/search" with "house=greyjoy" in the parameters
      expect(current_path).to eq(search_path)

      # And I should see a message "7 Members"
      expect(page).to have_content('7 Members')
      expect(page).to have_css(".member", count: 7)

      # And I should see a list of the 7 members of House Greyjoy

      # And I should see a name and id for each member.
      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".id")
      end

    end
  end
end
