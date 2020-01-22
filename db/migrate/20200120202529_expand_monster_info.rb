class ExpandMonsterInfo < ActiveRecord::Migration[6.0]
  def change
    change_table :monsters do |t|
      t.change :hitPoints, :string
      t.rename :hitPoints, :hitPointsAndDice
      t.remove :damage

      t.column :sizeTypeAlignment, :string
      t.column :armorClass, :string
      t.column :speed, :string
      t.column :strength, :string
      t.column :dexterity, :string
      t.column :constitution, :string
      t.column :intelligence, :string
      t.column :wisdom, :string
      t.column :charisma, :string
      t.column :skills, :string
      t.column :damageImmunities, :string
      t.column :conditionImmunities, :string
      t.column :senses, :string
      t.column :languages, :string
      t.column :challenge, :string
      t.column :properties, :json, array: true
      t.column :actions, :json, array: true
    end
  end
end
