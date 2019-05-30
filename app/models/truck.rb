class Truck < ApplicationRecord
  belongs_to :company
  has_many :truck_checks
  
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
  
#   validates :vehicle_number, presence: true
#   validates :last_odometer_reading, presence: true, length: { in: 1..10 }
#   validates :last_odometer_date, presence: true
end
