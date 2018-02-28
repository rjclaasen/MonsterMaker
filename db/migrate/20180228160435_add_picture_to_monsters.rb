class AddPictureToMonsters < ActiveRecord::Migration[5.1]
  def change
    add_column :monsters, :picture, :string
  end
end
