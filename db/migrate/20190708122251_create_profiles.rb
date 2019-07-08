class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :current_role
      t.string :carrier_goal

      t.timestamps
    end
  end
end
