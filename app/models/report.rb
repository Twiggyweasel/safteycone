# frozen_string_literal: true

# safety report records for users
class Report < ApplicationRecord
  belongs_to :user

  validates :record_id, presence: true, length: { is: 15 }
end
