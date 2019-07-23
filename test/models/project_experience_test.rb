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

require 'test_helper'

class ProjectExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
