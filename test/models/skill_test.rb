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

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
