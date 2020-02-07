json.extract! monster, :id, :name, :sizeTypeAlignment, :armorClass, :hitPointsAndDice, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :skills, :damageImmunities, :conditionImmunities, :senses, :languages, :challenge, :traits, :actions, :created_at, :updated_at
json.url monster_url(monster, format: :json)
