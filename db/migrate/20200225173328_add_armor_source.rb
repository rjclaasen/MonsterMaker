class AddArmorSource < ActiveRecord::Migration[6.0]
  def rollback_before
    Monster.find_each do |monster|
      if monster.armorSource.present?
        monster.update!(armorClass: "#{monster.armorClass} (#{monster.armorSource})")
      end
    end
  end

  def change
    add_column :monsters, :armorSource, :string
  end

  def data_after
    Monster.find_each do |monster|
      if monster.armorClass.present?
        splitString = monster.armorClass.split("(")
        armorClass = splitString[0].strip
        armorSource = splitString[1]&.gsub(/\)/, "")&.strip

        monster.update_attributes!(armorClass: armorClass, armorSource: armorSource)
      end
    end
  end
end
