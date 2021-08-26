class Phase < ApplicationRecord
  belongs_to :lead
  has_many :phase_assignments
  has_many :users, through: :phase_assignment
  has_many :comments
end
