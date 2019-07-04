require 'rails_helper'

RSpec.describe Truck, type: :model do
  subject { create(:truck) }
  
  describe 'Validations' do
    it 'should be invalid without a last odometer read date' do
      subject.last_odo_read_date = nil
      should be_invalid(subject)
    end

    it 'should be invalid without a last odometer reading' do
      subject.last_odo_reading = nil
      should be_invalid(subject)
    end
  end
end
