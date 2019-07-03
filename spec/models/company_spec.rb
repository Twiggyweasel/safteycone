require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class.new(name: 'Test Company', provision_key: 'TESTC', user_cap: 5)}
  
  describe 'validations' do
    it 'will be valid with valid attributes' do
      expect(subject).to be_valid
    end
    
    it 'will be invalid without a name' do
      subject.name = nil
      expect(subject).to be_invalid
    end
    
    it 'will be invalid without a provision_key' do
      subject.provision_key = nil
      expect(subject).to be_invalid
    end
    
    it 'will be invalid without an user_cap' do
      subject.user_cap = nil
      expect(subject).to be_invalid
    end
  end
end
