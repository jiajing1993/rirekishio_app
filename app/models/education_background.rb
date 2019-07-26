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

class EducationBackground < ApplicationRecord
  belongs_to :profile

  validates :university,
    presence: true
  validates :major,
    presence: true
  validates :graduation_date,
    presence: true
end
