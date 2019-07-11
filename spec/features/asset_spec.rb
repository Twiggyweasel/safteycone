require 'rails_helper'

RSpec.feature "Asset Features", type: :feature do
  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end  
  context "Create new Asset" do
    before(:each) do
      visit '/admin/companies/1/assets/new'
    end
    scenario "should be successful" do
      within('form') do
        fill_in "asset_asset_number", :with => rand(1..5000)
        click_button "Create"
      end
    end
  end
end