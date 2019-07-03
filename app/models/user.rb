# frozen_string_literal: true

# Users defines all users in applications SFA | Client Admin | Employees
class User < ApplicationRecord
  # defaults
  enum account_type: %i[admin company_admin employee]

  # relationships
  belongs_to :company, optional: true
  has_many :reports

  # validations
  validates :employee_number, uniqueness: true, unless: :new_record?
  validates :company, presence: true, if: :is_company_employee?
  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true, length: { in: 3..50 }
  validates :account_type, presence: true
  validates :contact_number, presence: true
  validates :email, presence: true
  validate :too_many_company_admins

  # callbacks
  #   after_create :set_employee_number if :is_company_employee?
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

  def set_employee_number
    update_column(:employee_number, company.id.to_s.rjust(3, "0") + self.id.to_s.rjust(3, "0"))
  end

  def too_many_company_admins
    if (self.account_type == "company_admin") && (self.company.company_admins.count >= 5)
      errors.add(:base, :exceeded_admin_count)
    end
  end
end
