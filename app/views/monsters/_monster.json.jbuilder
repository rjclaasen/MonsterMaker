json.extract! monster, :id, :name, :size, :type, :alignment, 
  :armorClass, :armorSource, :hitPointsAndDice, :speed, :strength, :dexterity, 
  :constitution, :intelligence, :wisdom, :charisma, :savingThrows, :skills, 
  :damageVulnerabilities, :damageResistances, :damageImmunities, 
  :conditionImmunities, :senses, :languages, :challenge, :traits, :actions, 
  :reactions, :created_at, :updated_at
json.author monster.author, :id, :username if monster.author.present?
json.url monster_url(monster, format: :json)
