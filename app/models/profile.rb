# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  current_role :string
#  carrier_goal :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user

  has_many :skills
  has_many :work_experiences
  has_many :education_backgrounds
  has_many :project_experiences
end
