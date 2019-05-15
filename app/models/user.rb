# frozen_string_literal: true

# Users defines all users in applications SFA | Client Admin | Employees
class User < ApplicationRecord
  # defaults
  enum account_type: %i[admin company_admin employee]

  # relationships
  belongs_to :company, optional: true
  has_many :reports

  # validations
  validates :company, presence: true, if: :not_admin
  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true, length: { in: 3..50 }
  validates :account_type, presence: true

  # methods
  def not_admin
    true unless account_type == 'admin'
  end

  def fullname
    "#{last_name}, #{first_name}"
  end
end
