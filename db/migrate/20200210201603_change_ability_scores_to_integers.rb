class ChangeAbilityScoresToIntegers < ActiveRecord::Migration[6.0]
  def up
    change_table :monsters do |t|
      t.change :strength, :integer, using: 'strength::integer'
      t.change :dexterity, :integer, using: 'dexterity::integer'
      t.change :constitution, :integer, using: 'constitution::integer'
      t.change :intelligence, :integer, using: 'intelligence::integer'
      t.change :wisdom, :integer, using: 'wisdom::integer'
      t.change :charisma, :integer, using: 'charisma::integer'
    end
  end

  def down
    change_table :monsters do |t|
      t.change :strength, :string
      t.change :dexterity, :string
      t.change :constitution, :string
      t.change :intelligence, :string
      t.change :wisdom, :string
      t.change :charisma, :string
    end
  end
end
