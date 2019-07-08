# == Schema Information
#
# Table name: project_experiences
#
#  id          :integer          not null, primary key
#  name        :string
#  link        :string
#  description :string
#

class ProjectExperience < ApplicationRecord
  belongs_to :profile
end
