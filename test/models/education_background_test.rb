# == Schema Information
#
# Table name: education_backgrounds
#
#  id              :integer          not null, primary key
#  graduation_date :date
#  major           :string
#  university      :string
#  profile_id      :integer
#
# Indexes
#
#  index_education_backgrounds_on_profile_id  (profile_id)
#

require 'test_helper'

class EducationBackgroundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
