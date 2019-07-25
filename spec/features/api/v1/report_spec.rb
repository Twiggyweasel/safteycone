require 'rails_helper'

RSpec.feature "Report API requests", type: :request do
  before(:each) do
    company = FactoryBot.create(:company)
    user = company.users.create(attributes_for(:user))
    login_as(user, :scope => :user)
    asset = FactoryBot.create(:asset)

  end  
  context 'Create new Report' do
    before do
      post "/api/v1/users/" + User.last.id.to_s + "/reports", params: { :report => { :user_id => User.last.id.to_s, :street => '123 test', :city => 'Lenexa', :state => 'KS', :zipcode => '12312', :completion_date => Time.now,  :asset_checks_attributes => { "0" => {:asset_id => Asset.last.id.to_s, "odometer_reading"=>"1", "has_defects"=>"0", "remarks"=>""}}}  }
    end
    
    scenario "should be successful" do
      puts JSON.parse(response.body)
      expect(JSON.parse(response.body)).not_to have_key('errors') 
#       expect(response).to have_http_status(:created)
    end
  end
end