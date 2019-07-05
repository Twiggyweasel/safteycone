require 'rails_helper'

RSpec.feature "Defect Features", type: :feature do
  context 'Create new Defect' do
    before(:each) do
      visit '/admin/defects/new'
    end
    scenario "should be successful" do
      within('form') do
        fill_in "defect_name", :with => "Test Defect"
        first("#defect_is_truck_defect").check
        first("#defect_is_active").check
        click_button "Create Defect"
      end
      expect(page).to have_content "Success"
    end
    scenario 'should fail' do
      within('form') do
        click_button "Create Defect"
      end
      expect(page).to have_content "can't be blank"
    end
  end
  
  context 'Update Defect' do
    before(:each) do
      visit '/admin/defects/1/edit'
    end
    scenario "should be successful" do
      within('form') do
        fill_in "defect_name", :with => "Test Defect"
        first("#defect_is_truck_defect").check
        first("#defect_is_active").check
        click_button "Update Defect"
      end
      expect(page).to have_content "Success"
    end
    scenario 'should fail' do
      within('form') do
        fill_in "defect_name", :with => ''
        click_button "Update Defect"
      end
      expect(page).to have_content "can't be blank"
    end
  end    
  
  context 'Delete Defect' do
    scenario 'should be successful' do
      defect = Defect.create(name: 'Test')
      visit(admin_defect_path(defect))
      click_link 'Delete'
      expect(page).to have_content 'Defect was successfully destroyed.'
    end
  end
  
  context 'status label' do
    before(:each) do
      visit '/admin/defects/1/edit'
    end
    scenario 'active when is_active' do
      within('form') do
        first("#defect_is_active").check
        click_button "Update Defect"
      end
      expect(page).to have_css '#active-tag'
    end
    
    scenario 'disabled with !is_active' do
      within('form') do
        first("#defect_is_active").uncheck
        click_button "Update Defect"
      end  
      expect(page).to have_css '#disabled-tag'
    end
  end
end