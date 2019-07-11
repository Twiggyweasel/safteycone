require 'rails_helper'

RSpec.feature "Admin User Features", type: :feature do
  before(:each) do
    user = FactoryBot.create(:admin_user)
    FactoryBot.create(:company)
    login_as(user, :scope => :user)
  end
  context 'Create new Company Admin' do
    before(:each) do
      visit 'admin/companies/1/users/new'  
    end
    scenario 'should be successful' do
      expect(page).to have_css(".title", text: "Create User")
      within('form') do
        fill_in "user_employee_number", with: rand(1..999999999)
        fill_in "user_first_name", with: "Test"
        fill_in "user_last_name", with: "Test"
        fill_in "user_contact_number", with: "1111111111"
        fill_in "user_email", with: FFaker::Internet.email
        fill_in "user_password", with: 'testing'
        select 'Admin', from: 'user_account_type'
        click_button "Create User"
      end
      expect(page).to have_content "User Successfully Created!"
    end
    
    scenario 'should fail' do
      expect(page).to have_css(".title", text: "Create User")
      within('form') do
        select 'Admin', from: 'user_account_type'
        click_button "Create User"
      end
      expect(page).to have_css('.field_with_errors')
    end
    
    scenario 'should appear in Admin Table' do
      expect(page).to have_css(".title", text: "Create User")
      within('form') do
        fill_in "user_employee_number", with: rand(1..999999999)
        fill_in "user_first_name", with: "Admin"
        fill_in "user_last_name", with: "Test"
        fill_in "user_contact_number", with: "1111111111"
        fill_in "user_email", with: FFaker::Internet.email
        fill_in "user_password", with: 'testing'
        select 'Admin', from: 'user_account_type'
        click_button "Create User"
      end
      visit admin_company_path(1)
      expect(page).to have_css('#admin_1', text: 'Test, Admin')
    end
  end
  
  context 'Create new Employee' do
    before(:each) do
      visit 'admin/companies/1/users/new'  
    end
    scenario 'should be successful' do
      expect(page).to have_css(".title", text: "Create User")
      within('form') do
        fill_in "user_employee_number", with: rand(1..999999999)
        fill_in "user_first_name", with: "Test"
        fill_in "user_last_name", with: "Test"
        fill_in "user_contact_number", with: "1111111111"
        fill_in "user_email", with: FFaker::Internet.email
        fill_in "user_password", with: 'testing'
        select 'Employee', from: 'user_account_type'
        click_button "Create User"
      end
      expect(page).to have_content "User Successfully Created!"
    end
    
    scenario 'should fail' do
      expect(page).to have_css(".title", text: "Create User")
      within('form') do
        select 'Employee', from: 'user_account_type'
        click_button "Create User"
      end
      expect(page).to have_css('.field_with_errors')
    end
    
    scenario 'should appear in Employee Table' do
      expect(page).to have_css(".title", text: "Create User")
        within('form') do
          fill_in "user_employee_number", with: rand(1..999999999)
          fill_in "user_first_name", with: "Employee"
          fill_in "user_last_name", with: "Test"
          fill_in "user_contact_number", with: "1111111111"
          fill_in "user_email", with: FFaker::Internet.email
          fill_in "user_password", with: 'testing'
          select 'Employee', from: 'user_account_type'
          click_button "Create User"
        end
      visit admin_company_path(1)
      expect(page).to have_css('#employee_1', text: 'Test, Employee')
    end
  end
end