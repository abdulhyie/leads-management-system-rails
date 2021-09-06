class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role 

  # validates :role_id, :user_id, presence: true
end
