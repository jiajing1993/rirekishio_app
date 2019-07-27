class AddStyleToTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :style, :string
  end
end
