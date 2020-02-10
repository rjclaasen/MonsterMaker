class AddMissingPropertiesToMonsters < ActiveRecord::Migration[6.0]
  def change
    change_table :monsters do |t|
      t.column :savingThrows, :string
      t.column :damageVulnerabilities, :string
      t.column :damageResistances, :string
    end
  end
end
