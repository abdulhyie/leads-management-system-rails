class Comment < ApplicationRecord
  belongs_to :phase
  belongs_to :user

  # validates :comment_body, :phase_id, :user_id, presence: true
end
