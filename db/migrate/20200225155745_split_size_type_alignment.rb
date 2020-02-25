class SplitSizeTypeAlignment < ActiveRecord::Migration[6.0]
  def up
    add_column :monsters, :size, :string
    add_column :monsters, :type, :string
    add_column :monsters, :alignment, :string

    Monster.find_each do |monster|
      if monster.sizeTypeAlignment?
        removedCommas = monster.sizeTypeAlignment.gsub(/,/, "")
        splitString = removedCommas.split(" ")

        size, type, *tail = splitString
        alignment = tail.join(' ')

        monster.size = size
        monster.type = type
        monster.alignment = alignment
        monster.save!
      end
    end

    remove_column :monsters, :sizeTypeAlignment
  end

  def down
    add_column :monsters, :sizeTypeAlignment, :string

    Monster.find_each do |monster|
      monster.sizeTypeAlignment = "#{monster.size} #{monster.type}".strip

      if monster.alignment?
        monster.sizeTypeAlignment += ", " if !monster.sizeTypeAlignment.blank?
        monster.sizeTypeAlignment += monster.alignment
      end

      monster.save!
    end

    remove_column :monsters, :size
    remove_column :monsters, :type
    remove_column :monsters, :alignment
  end
end
