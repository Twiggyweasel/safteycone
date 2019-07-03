require 'rails_helper'

RSpec.describe AssetCheck, type: :model do
  let(:report) { create(:report)}
  subject { create(:asset_check, report: report) }
  
  describe 'Associations' do
    it { should belong_to(:report) }
    it { should belong_to(:asset) }
    it { should have_and_belong_to_many(:defects) }
  end
  
  describe 'Validations' do
    it 'will be invalid without remarks if has_defects' do
      subject.has_defects = true
      subject.remarks = nil
      expect(subject).to be_invalid
    end
    
    it 'will be invalid without defects if has_defects' do
      subject.has_defects = true
      subject.defects = []
      expect(subject).to be_invalid
    end
  end
  
  describe '#Set_Record_Number' do
    it 'will have a record number after being created' do
      subject.set_record_number
      expect(subject.record_number).to eq(subject.report.record_number + '-001')
    end
  end
end
