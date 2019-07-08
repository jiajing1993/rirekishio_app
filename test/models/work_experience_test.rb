# == Schema Information
#
# Table name: work_experiences
#
#  id          :integer          not null, primary key
#  company     :string
#  role        :string
#  start_date  :date
#  end_date    :date
#  city        :string
#  description :string
#  profile_id  :integer
#

require 'test_helper'

class WorkExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
