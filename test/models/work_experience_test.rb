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
    @item = WorkExperience.new
    @item.profile = @profile

    @item.start_date = @earlier_date # => Case #0: correct pair.
    @item.end_date = @later_date
    assert @item.valid?

    @item.start_date = @later_date # => Case #1: end date earlier than start date.
    @item.end_date = @earlier_date
    assert_not @item.valid?

    @item.start_date = @later_date # => Case #2: same value.
    @item.end_date = @later_date
    assert_not @item.valid?
  end
end
