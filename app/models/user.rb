class User < ApplicationRecord
#   defaults
  enum account_type: [:admin, :company_admin, :employee]
#   relationships
  belongs_to :company, optional: true
#   validations
  validates :company, presence: true, if: :not_admin
#   methods
  def not_admin
    account_type != "admin"
  end
end
