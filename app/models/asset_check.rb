# frozen_string_literal: true

class AssetCheck < ApplicationRecord
  #   belongs_to :checkable
  belongs_to :report
  belongs_to :asset
  has_and_belongs_to_many :defects

  validates :remarks, presence: true, if: :requires_defects_and_remarks
  validates :defects, length: { minimum: 1 }, if: :requires_defects_and_remarks

  def requires_defects_and_remarks
    has_defects
  end

  def set_record_number
    update_column(:record_number, report.record_number + "-001")
  end
end
