class Lead < ApplicationRecord
  belongs_to :user
  has_many :phases, dependent: :delete_all
  has_one :project_lead, dependent: :destroy

  validates :project_name, :client_name, :client_email, :client_contact, :client_address, :platform, presence: true
end
