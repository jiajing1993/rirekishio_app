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

class WorkExperience < ApplicationRecord
  belongs_to :profile 
  validate :end_date_cannot_be_earlier_than_or_equal_to_start_date

  private

  def end_date_cannot_be_earlier_than_or_equal_to_start_date
    if end_date < start_date || end_date == start_date
      errors.add :expiration_date, "End date cannot be earlier than or equal to start date."
    end
  end
end
