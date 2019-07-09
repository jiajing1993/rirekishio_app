class AddReferencesProfileToProjectExperiences < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_experiences, :profile, foreign_key: true
  end
end
