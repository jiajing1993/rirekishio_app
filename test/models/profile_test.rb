# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  current_role :string
#  career_goal  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    legal_user = users(:one)

    name_normal = "Lasery Lee"
    name_long = "a"*51
    
    email_normal = "admin@admin.admin"
    email_incorrect = "admin.admin"
    email_long = "a"*256
    email_upcase = "ADMIN@adMIN.admin"

    phone_number_normal = "012-4319876"
    phone_number_long = "234-451451-451-5135-15"
    phone_number_space = "012-431 5378"
    phone_number_space_end = "012-431 5434  "
    
    current_role_normal = "Chef"
    current_role_long = "a"*51

    career_goal_normal = "To be an inspiring chef."
    career_goal_long = "a"*256
  end

end
