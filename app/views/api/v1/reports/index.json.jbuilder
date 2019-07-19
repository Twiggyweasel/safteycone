# frozen_string_literal: true

json.user do
  json.employee_number @user.employee_number
  json.fullname @user.fullname
end

json.reports @reports do |r|
  json.record_number = r.record_number
  json.completion = r.completion_date
  json.status = r.is_complete? ? "Complete" : "Pending"
  json.asset_checks r.asset_checks do |ac|
    json.record_number = ac.record_number
    json.asset = ac.asset.asset_number
  end
end
