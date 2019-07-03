require 'rails_helper'

RSpec.describe Defect, type: :model do
  subject { described_class.new(name: 'Test', is_truck_defect: true, is_trailer_defect: false, is_active: true)}
  
  describe "Associations" do
    it { should have_and_belong_to_many(:asset_checks) }
  end
  
  describe "validations" do
    it "will be valid with valid attributes" do
      expect(subject).to be_valid  
    end
    
    it "will be invalid without a name" do
      subject.name = nil
      expect(subject).to be_invalid
    end
    
    it "will be invalid if active and not a truck defect" do
      subject.is_truck_defect = false
      expect(subject).to be_invalid
    end
  end
  
  describe "#is_active?" do
    it "will return the current items status" do
      expect(subject.is_active?).to be_truthy
    end
  end
end
