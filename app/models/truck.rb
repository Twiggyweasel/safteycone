# frozen_string_literal: true

# class Truck < ApplicationRecord
#   belongs_to :company
#   has_many :truck_checks

#   scope :active, -> { where(is_active: true) }
#   scope :inactive, -> { where(is_active: false) }
#   after_create :set_last_read_date
#   validates :vehicle_number, presence: true
#   validates :last_odometer_reading, presence: true, length: { in: 1..10 }
#   validates :last_odometer_date, presence: true, unless: :new_record?

#   def set_last_read_date
#     unless !last_odometer_date.blank?
#       update_column(:last_odometer_date, Time.now)
#     end
#   end
# end
class Truck < Asset
  validates :last_odo_reading, presence: true, length: { in: 1..10 }
  validates :last_odo_read_date, presence: true
end
