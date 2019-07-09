class AddPictureToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :picture, :string
  end
end
