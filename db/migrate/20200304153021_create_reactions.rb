class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.belongs_to :monster
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
