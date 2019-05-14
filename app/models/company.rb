class Company < ApplicationRecord
  has_many :employees, -> { where account_type: 'employee' }, class_name: 'User'
  has_many :company_admins, -> { where account_type: 'company_admin' }, class_name: 'User'
end
