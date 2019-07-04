require 'rails_helper'

RSpec.describe Asset, type: :model do
  subject { create(:asset) }
  
  describe "Associations" do
    it { should belong_to(:company) }
  end
  
  describe "Asset Validations" do
    it { should be_valid(subject) }
    
    it "should be invalid without asset_number" do
      subject.asset_number = nil
      should be_invalid(subject)
    end
    
    it 'should be invalid without a type' do
      subject.type = nil
      should be_invalid(subject)
    end
    
    it 'should be invalid without a last service date' do
      subject.last_service_date = nil
      should be_invalid(subject)
    end
  end
end
