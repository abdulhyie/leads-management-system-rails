class PhaseAssignment < ApplicationRecord
  belongs_to :user  
  belongs_to :phase  

  # validates :phase_type, :start_date, :due_date, :phase_status, :lead_id, presence: true
end
