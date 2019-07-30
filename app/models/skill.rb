# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  description :string
#  proficiency :string
#  skills      :string
#  profile_id  :integer
#
# Indexes
#
#  index_skills_on_profile_id  (profile_id)
#

class Skill < ApplicationRecord
  belongs_to :profile

  validates :proficiency,
    presence: true
  validates :skills,
    presence: true
  validates :description,
    presence: true
end
