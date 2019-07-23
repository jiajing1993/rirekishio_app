# == Schema Information
#
# Table name: work_experiences
#
#  id          :integer          not null, primary key
#  city        :string
#  company     :string
#  description :string
#  end_date    :date
#  role        :string
#  start_date  :date
#  profile_id  :integer
#
# Indexes
#
#  index_work_experiences_on_profile_id  (profile_id)
#

class WorkExperience < ApplicationRecord
  belongs_to :profile 

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :company, presence: true
  validates :role, presence: true
  validates :city, presence: true
  validate :valid_duration

  private

  def valid_duration
    if end_date.present? && start_date.present?
      if end_date < start_date
        errors.add :start_date, "Cannot later than end date."
        errors.add :end_date, "Cannot earlier than start date."
      elsif end_date == start_date
        errors.add :start_date, "Cannot equal to end date."
        errors.add :end_date, "Cannot equal to start date."
      end
    end
  end
end
