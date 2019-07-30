# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  content    :string
#  name       :string
#  style      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Template < ApplicationRecord
  before_save :underscore_name

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A(([a-z]+(_[a-z]+)*)|([a-z]+(\s[a-z]+)*))\z/i }

  private

  def underscore_name
    self.name = name.downcase
    self.name = name.gsub(/\s/, '_')
  end
end
