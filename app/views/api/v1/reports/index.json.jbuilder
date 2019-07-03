# frozen_string_literal: true

json.user do
  json.employee_number @user.employee_number
  json.fullname @user.fullname
end

json.reports @reports do |r|
  json.record_number = r.record_number
end
