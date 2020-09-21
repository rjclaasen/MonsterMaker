class SplitHitPointsAndDice < ActiveRecord::Migration[6.0]
  def up
    add_column :monsters, :hitPoints, :integer
    add_column :monsters, :hitDice, :string
    Monster.reset_column_information

    Monster.find_each do |monster|
      if monster.hitPointsAndDice.present?
        splitString = monster.hitPointsAndDice.split(' ');

        hitPoints, *tail = splitString
        hitDice = tail.join(' ').strip
        hitDice = hitDice.gsub(/^\(|\)$/, "") # Remove parentheses at begin/end of string

        monster.update_attributes!(hitPoints: hitPoints, hitDice: hitDice)
      end
    end

    remove_column :monsters, :hitPointsAndDice
  end

  def down
    add_column :monsters, :hitPointsAndDice, :string
    Monster.reset_column_information

    Monster.find_each do |monster|
      if monster.hitPoints.present? || monster.hitDice.present?
        hitPointsText = monster.hitPoints || "-"
        hitDiceText = monster.hitDice.present? ? " (#{monster.hitDice})" : ""
        hitPointsAndDice = "#{hitPointsText}#{hitDiceText}"

        monster.update!(hitPointsAndDice: hitPointsAndDice)
      end
    end

    remove_column :monsters, :hitPoints
    remove_column :monsters, :hitDice
  end
end
