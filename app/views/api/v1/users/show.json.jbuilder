# frozen_string_literal: true

json.user do
  json.fullname @user.fullname
  json.contact_number @user.contact_number
  json.email @user.email
  json.provision_key @user.company.provision_key
  json.reports @user.reports do |r|
    json.id r.id
    json.record_id r.record_id
    json.is_complete r.is_complete
  end
end
