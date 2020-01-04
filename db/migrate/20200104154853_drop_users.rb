class DropUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :users
    change_table :monsters do |t|
      t.remove_index [:user_id, :created_at]
      t.remove :user_id
    end
    add_index :monsters, :created_at
  end
end
