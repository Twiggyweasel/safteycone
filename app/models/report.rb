# frozen_string_literal: true

# safety report records for users
class Report < ApplicationRecord
  belongs_to :user
  has_one :company, through: :user
  has_many :truck_checks, inverse_of: :report
  has_many :trucks, through: :truck_checks
#   has_many :trailer_checks

  accepts_nested_attributes_for :truck_checks, allow_destroy: true
  validates_associated :truck_checks
  
  validates :record_number, presence: true, length: { minimum: 9 }, unless: :new_record?
  validates :completion_date, presence: true 
  validates :street, presence: true, length: { in: 2..50 }
  validates :city, presence: true, length: { in: 2..50 }
  validates :state, presence: true, length: { is: 2 }
  validates :zipcode, presence: true, length: { in: 5..10 }
  
  after_create :set_record_number
  
  def set_record_number
    update_column(:record_number, self.company.id.to_s + self.id.to_s.rjust(8, '0'))
    truck_checks.each do |tc| tc.set_record_number end
  end
end
