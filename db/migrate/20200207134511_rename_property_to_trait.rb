class RenamePropertyToTrait < ActiveRecord::Migration[6.0]
  def change
    rename_column :monsters, :properties, :traits
    rename_table :properties, :traits
  end
end
