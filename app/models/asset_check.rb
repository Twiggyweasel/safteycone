# frozen_string_literal: true

class AssetCheck < ApplicationRecord
  #   belongs_to :checkable
  belongs_to :report
  belongs_to :asset
  has_and_belongs_to_many :defects

  validates :remarks, presence: true, if: :requires_defects_and_remarks
  validates :defects, length: { minimum: 1 }, if: :requires_defects_and_remarks

  after_save :assess_status

  def requires_defects_and_remarks
    has_defects
  end

  def assess_status
    if has_defects && !cleared
      trigger_report_processing
    elsif !has_defects && !cleared
      update_column(:cleared, true)
      trigger_report_processing
    end
  end

  def trigger_report_processing
    report.process_report
  end

  def set_record_number
    update_column(:record_number, report.record_number + "-001")
  end
end
