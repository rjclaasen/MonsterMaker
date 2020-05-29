class AddAuthorToMonsters < ActiveRecord::Migration[6.0]
  def change
    add_reference :monsters, :user
  end
end
