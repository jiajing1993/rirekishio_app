# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  current_role :string
#  career_goal  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  picture      :string
#

class Profile < ApplicationRecord
  belongs_to :user, optional: true

  has_many :skills
  has_many :work_experiences
  has_many :education_backgrounds
  has_many :project_experiences

  validates_associated :skills, :work_experiences, :education_backgrounds, :project_experiences

  mount_uploader :picture, PictureUploader

  accepts_nested_attributes_for :skills, :work_experiences, :education_backgrounds, :project_experiences, allow_destroy: true

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 50 }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 255 },
    format: { with: /\A[\w\d\-.]+@([a-z\d\-]+\.)+[a-z]+\z/i }
  validates :phone_number,
    presence: true,
    format: { with: /\A[\d-]+[\s\d]+[\d]\z/ },
    length: { maximum: 20 } # => currently no restrictions for phone number format
  validates :current_role,
    presence: true,
    length: { maximum: 50 }
  validates :career_goal,
    presence: true,
    length: { maximum: 255 }
  validates :user_id,
    uniqueness: true, # => No user can have more than 1 profile
    allow_nil: true
  validates :picture,
    presence: true
end
