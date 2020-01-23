class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.belongs_to :monster
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
