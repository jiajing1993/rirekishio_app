# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  content    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Template < ApplicationRecord
end
