require 'rails_helper'

RSpec.feature "Companies", type: :feature do
  context 'create new Company'
    before(:each) do
      visit '/admin/companies/new'
    end
    scenario "should be successful" do
      within('form') do
        fill_in "company_name", :with => "{@company.name}"
        fill_in "company_provision_key", :with => "{@company.provision_key}"
        fill_in "company_user_cap", :with => 5
        click_button "Create"
      end
    end
    
    scenario "should fail" do
      click_button 'Create'
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Provision key can't be blank"
      expect(page).to have_content "User cap can't be blank"
  end
end