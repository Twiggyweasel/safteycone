require 'rails_helper'

RSpec.describe Trailer, type: :model do
  subject { create(:trailer) }
  
  describe 'Validations' do
    it 'should be valid without a last odometer read date' do
      subject.last_odo_read_date = nil
      should be_valid(subject)
    end

    it 'should be valid without a last odometer reading' do
      subject.last_odo_reading = nil
      should be_valid(subject)
    end
  end
end
