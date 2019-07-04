# frozen_string_literal: true

class Asset < ApplicationRecord
  belongs_to :company

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }

  validates :asset_number, presence: true, length: { in: 3..15 }
  validates_uniqueness_of :asset_number, scope: :company
  validates :type, presence: true
  validates :last_service_date, presence: true
end
