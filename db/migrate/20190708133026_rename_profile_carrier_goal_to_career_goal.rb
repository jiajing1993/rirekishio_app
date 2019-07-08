class RenameProfileCarrierGoalToCareerGoal < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :carrier_goal, :career_goal
  end
end
