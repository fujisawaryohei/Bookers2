class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""
      
      t.timestamps
    end
  end
end
