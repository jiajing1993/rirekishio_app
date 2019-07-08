class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.string :company
      t.string :role
      t.date :start_date
      t.date :end_date
      t.string :city
      t.string :description

      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
