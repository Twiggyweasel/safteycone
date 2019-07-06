require 'rails_helper'

RSpec.feature "Company Features", type: :feature do
  context 'Create new Company' do
    before(:each) do
      visit '/admin/companies/new'
    end
    scenario "should be successful" do
      within('form') do
        fill_in "company_name", :with => "Company 1"
        fill_in "company_provision_key", :with => "COMP1"
        fill_in "company_user_cap", :with => 5
        click_button "Create"
      end
      expect(page).to have_content 'success'
      expect(page).to have_content 'Company successfully created!'      
    end
    
    scenario "should fail" do
      click_button 'Create'
      expect(page).to have_content "can't be blank"
    end
  end
  
  context 'Update Company' do
    before(:each) do
      visit '/admin/companies/1/edit'
    end
    scenario 'should be successful' do
      within('form') do
        fill_in 'company_name', :with => 'Super Company'
        click_button "Update"
      end
      expect(page).to have_content 'success'
      expect(page).to have_content 'Company successfully updated!'
    end
    
    scenario 'should be unsuccessful' do
      within('form') do
        fill_in 'company_name', :with => ''
        click_button "Update"
      end
      expect(page).to have_content "can't be blank"
    end
  end
end