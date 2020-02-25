class SplitSizeTypeAlignment < ActiveRecord::Migration[6.0]
  def up
    add_column :monsters, :size, :string
    add_column :monsters, :type, :string
    add_column :monsters, :alignment, :string
    Monster.reset_column_information

    Monster.find_each do |monster|
      if monster.sizeTypeAlignment.present?
        removedCommas = monster.sizeTypeAlignment.gsub(/,/, "")
        splitString = removedCommas.split(" ")

        size, type, *tail = splitString
        alignment = tail.join(' ')

        monster.update_attributes!(size: size, type: type, alignment: alignment)
      end
    end

    remove_column :monsters, :sizeTypeAlignment
  end

  def down
    add_column :monsters, :sizeTypeAlignment, :string
    Monster.reset_column_information

    Monster.find_each do |monster|
      sizeTypeAlignment = "#{monster.size} #{monster.type}".strip

      if monster.alignment.present?
        sizeTypeAlignment += ", " if !sizeTypeAlignment.blank?
        sizeTypeAlignment += monster.alignment
      end

      monster.update!(sizeTypeAlignment: sizeTypeAlignment)
    end

    remove_column :monsters, :size
    remove_column :monsters, :type
    remove_column :monsters, :alignment
  end
end
