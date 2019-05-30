class TruckCheck < ApplicationRecord
  belongs_to :report
  belongs_to :truck
  has_and_belongs_to_many :defects
  
  validates :odometer_reading, presence: true, length: { in: 1..10 }
  
  after_create :evaluate, :update_truck
  def evaluate
    unless has_defects
      update_column(:is_cleared, true)
      update_report
    end
  end
  
  def update_truck
    truck.update(last_odometer_reading: odometer_reading)
    truck.touch(:last_odometer_date)
  end
  
  def update_report
    report.update(is_complete: true)
  end
  
  def set_record_number
    update_column(:record_number, report.record_number + "-001")
  end
end
