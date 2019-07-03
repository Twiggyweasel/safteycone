require 'rails_helper'

RSpec.describe Report, type: :model do
  subject { create(:report, :with_asset_check) }
  
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_one(:company) }
    it { should have_many(:asset_checks) }
    it { should have_many(:assets) }
    it { should accept_nested_attributes_for(:asset_checks) }
  end
  
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    
    it 'is invalid without a completion_date' do
      subject.completion_date = nil
      expect(subject).to be_invalid
    end
        
    it 'is invalid without a street' do
      subject.street = nil
      expect(subject).to be_invalid
    end
        
    it 'is invalid without a city' do
      subject.city = nil
      expect(subject).to be_invalid
    end
         
    it 'is invalid without a state' do
      subject.state = nil
      expect(subject).to be_invalid
    end
        
    it 'is invalid without a zipcode' do
      subject.zipcode = nil
      expect(subject).to be_invalid
    end
    
    it { should validate_length_of(:asset_checks) }
    
    it 'have at least one asset_check' do
      expect(AssetCheck.where(report_id: subject.id)).to exist
    end
  end
end
