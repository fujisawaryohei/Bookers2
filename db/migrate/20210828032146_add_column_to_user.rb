class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :introduction, :text, null: false
  end
end
