# == Schema Information
#
# Table name: project_experiences
#
#  id          :integer          not null, primary key
#  name        :string
#  link        :string
#  description :string
#  profile_id  :integer
#

class ProjectExperience < ApplicationRecord
  belongs_to :profile
  validates :name,
    presence: true
  validates :description,
    presence: true
end
