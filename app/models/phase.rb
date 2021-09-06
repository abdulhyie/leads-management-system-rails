class Phase < ApplicationRecord
  belongs_to :lead
  belongs_to :user
  has_many :phase_assignments, dependent: :delete_all
  has_many :users, through: :phase_assignment
  has_many :comments, dependent: :delete_all

  validates :phase_type, :start_date, :due_date, :phase_status, presence: true
end
