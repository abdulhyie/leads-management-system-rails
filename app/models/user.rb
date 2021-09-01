class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_role
  has_many :leads
  has_many :phase_assignments
  has_many :phases, through: :phase_assignment
  has_many :comments
  has_many :phases
end
