class Lead < ApplicationRecord
  belongs_to :user
  has_many :phases
  has_one :project_lead
end
