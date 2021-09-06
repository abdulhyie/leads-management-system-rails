class ProjectLead < ApplicationRecord
  belongs_to :lead

  # validates :comment_body, :phase_id, :user_id, presence: true
end
