class CreateEducationBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :education_backgrounds do |t|
      t.string :university
      t.string :major
      t.date :graduation_date

      t.references :profile, foreign_key: true
    end
  end
end
