# frozen_string_literal: true

# Users defines all users in applications SFA | Client Admin | Employees
class User < ApplicationRecord
  # defaults
  enum account_type: %i[admin company_admin employee]

  # relationships
  belongs_to :company, optional: true
  has_many :reports

  # validations
  validates :company, presence: true, if: :is_company_employee?
  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true, length: { in: 3..50 }
  validates :account_type, presence: true
  validates :contact_number, presence: true
  validates :email, presence: true

  # methods
  def is_company_employee?
    true if account_type != "admin"
  end
  
  def is_admin?
    !is_company_employee?
  end

  def fullname
    "#{last_name}, #{first_name}"
  end
end
