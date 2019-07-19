# frozen_string_literal: true

json.user do
  json.employee_number @user.employee_number
  json.fullname @user.fullname
  json.company do
    json.id @user.company.id
    json.name @user.company.name
  end
end

json.report do
  json.record_number @report.record_number
  json.completion r.completion_date.try(:strftime, "%m/%d/%Y at %I:%M%p")
  json.status @report.is_complete? ? "Complete" : "Pending"
  json.asset_checks @report.asset_checks.each do |asset_check|
    json.record_number asset_check.record_number
    json.asset asset_check.asset.asset_number
    json.has_defects asset_check.has_defects
    json.defects asset_check.defects do |defect|
      json.name = defect.name
    end
  end
end
