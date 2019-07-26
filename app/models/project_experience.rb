# == Schema Information
#
# Table name: project_experiences
#
#  id          :integer          not null, primary key
#  description :string
#  link        :string
#  name        :string
#  profile_id  :integer
#
# Indexes
#
#  index_project_experiences_on_profile_id  (profile_id)
#

class ProjectExperience < ApplicationRecord
  belongs_to :profile
  validates :name,
    presence: true
  validates :description,
    presence: true
end
