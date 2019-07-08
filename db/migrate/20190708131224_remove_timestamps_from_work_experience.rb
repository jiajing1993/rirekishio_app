class RemoveTimestampsFromWorkExperience < ActiveRecord::Migration[5.2]
  def change
    remove_timestamps :work_experiences
  end
end
