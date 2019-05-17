# frozen_string_literal: true

json.users @users do |u|
  json.first_name u.first_name
  json.last_name u.last_name
  json.account_type u.account_type
  json.company_name u.company.name
end
