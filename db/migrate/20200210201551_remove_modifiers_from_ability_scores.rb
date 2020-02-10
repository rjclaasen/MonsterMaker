class RemoveModifiersFromAbilityScores < ActiveRecord::Migration[6.0]
  def up
    Monster.find_each do |monster|
      monster.strength = remove_modifier(monster.strength)
      monster.dexterity = remove_modifier(monster.dexterity)
      monster.constitution = remove_modifier(monster.constitution)
      monster.intelligence = remove_modifier(monster.intelligence)
      monster.wisdom = remove_modifier(monster.wisdom)
      monster.charisma = remove_modifier(monster.charisma)
      monster.save!
    end
  end

  def down
    Monster.find_each do |monster|
      monster.strength = add_modifier(monster.strength)
      monster.dexterity = add_modifier(monster.dexterity)
      monster.constitution = add_modifier(monster.constitution)
      monster.intelligence = add_modifier(monster.intelligence)
      monster.wisdom = add_modifier(monster.wisdom)
      monster.charisma = add_modifier(monster.charisma)
      monster.save!
    end
  end

  def remove_modifier(string)
    return string[/\d+/]
  end

  def add_modifier(ability_score)
    modifier = ((ability_score.to_i - 10) / 2).floor

    return "#{ability_score} (#{add_plus_maybe(modifier)})"
  end

  def add_plus_maybe(number)
    if number >= 0
      return "+#{number}"
    else
      return number
    end
  end
end
