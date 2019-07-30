class AddTemplateToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :template, foreign_key: true
  end
end
