class Defect < ApplicationRecord
  has_and_belongs_to_many :truck_checks
end
