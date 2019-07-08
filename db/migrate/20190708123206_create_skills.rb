class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :proficiency
      t.string :skills
      t.string :description
      t.references :profile, foreign_key: true
    end
  end
end
