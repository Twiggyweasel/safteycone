require 'rails_helper'

RSpec.describe Asset, type: :model do
  subject { create(:asset) }
  
  describe "Associations" do
    it { should belong_to(:company) }
  end
  
  describe "Validations" do
    it { should be_valid(subject) }
    
    it "should be invalid without asset_number" do
      subject.asset_number = nil
      should be_invalid(subject)
    end
  end
end
