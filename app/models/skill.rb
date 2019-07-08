# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  proficiency :string
#  skills      :string
#  description :string
#  profile_id  :integer
#

class Skill < ApplicationRecord
  belongs_to :profile
end
