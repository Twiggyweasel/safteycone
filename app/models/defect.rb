# frozen_string_literal: true

class Defect < ApplicationRecord
  has_and_belongs_to_many :asset_checks

  scope :truck_defects, -> { where(is_truck_defect: true) }
  scope :trailer_defects, -> { where(is_trailer_defect: true) }

  validates :name, presence: true
end
