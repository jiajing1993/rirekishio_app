# == Schema Information
#
# Table name: education_backgrounds
#
#  id              :integer          not null, primary key
#  university      :string
#  major           :string
#  graduation_date :date
#  profile_id      :integer
#

class EducationBackground < ApplicationRecord
  belongs_to :profile
end
