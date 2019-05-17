# frozen_string_literal: true

# Houses company data and limits based on SFA Client list
class Company < ApplicationRecord
  has_many :users
  has_many :employees, -> { where account_type: "employee" },
           class_name: "User"
  has_many :company_admins, -> { where account_type: "company_admin" },
           class_name: "User"
  has_many :reports, through: :employees

  validates :name, presence: true, length: { in: 3..50 }
  validates :provision_key, presence: true, length: { in: 3..20 }
  validates :user_cap, presence: true, numericality: { greater_than: 0, less_than: 100 }
end
