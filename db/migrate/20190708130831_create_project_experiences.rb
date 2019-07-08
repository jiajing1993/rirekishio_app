class CreateProjectExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :project_experiences do |t|
      t.string :name
      t.string :link
      t.string :description
    end
  end
end
