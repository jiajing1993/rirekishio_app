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
  def setup
    @earlier_date = Date.new(2007, 1, 1)
    @later_date = Date.new(2017, 1, 1)
    @profile = profiles(:one)
  end

  test "End date cannot be earlier than or equal to start date" do
    @work_exp = WorkExperience.new
    @work_exp.profile = @profile

    @work_exp.start_date = @earlier_date # => Case #0: correct pair.
    @work_exp.end_date = @later_date
    assert @work_exp.valid?

    @work_exp.start_date = @later_date # => Case #1: end date earlier than start date.
    @work_exp.end_date = @earlier_date
    assert_not @work_exp.valid?

    @work_exp.start_date = @later_date # => Case #2: same value.
    @work_exp.end_date = @later_date
    assert_not @work_exp.valid?
  end
end
