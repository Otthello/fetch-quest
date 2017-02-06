module BasicSeeder

  def self.users
    user_info = {
      username: "VargouilleSupreme",
      avatar_url: "http://i.imgur.com/9zxJla4.png",
      email: "test@test.com",
      password:"test"
    }
    User.create(user_info)
  end

  def self.npcs
    npc_info = {
      avatar_url: "http://i.imgur.com/DWTH8wm.png",
      name: "Ken the Paladin"
    }
    Npc.create(npc_info)
  end

  def self.quests
    quest_info = {
      icon_url: "http://i.imgur.com/NlZj5vv.gif",
      hook: "I don't like that castle.",
      description: "Ken doesn't like that castle. Destroy it and he'll give you sweet loot"
    }
    Quest.create(quest_info)
  end

  def self.items
    item_info = {
      slot: 1,
      rarity: 2,
      image_url: "http://i.imgur.com/9jqJu7s.png",
      description: "Sweet hat brah",
      name: "Pointy hat"
    }
    Item.create(item_info)
  end

  def self.errands
    errand_info = {
      task: "Buy snacks from target",
      lat: "41.876953",
      lng: "-87.655314",
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: 0
    }
    Errand.create(errand_info)
  end

  def self.equips
    equip_info = {
      owner_id: 1,
      lootable_id: 1,
      lootable_type: 'Item'
    }
    Equip.create(equip_info)
  end

  def self.apikey
    test = Apikey.new(email: "test@tester.com", domain: 'tester.com')
    test.save
    puts "/"* 50
    puts "YOUR KEY DON'T LOSE IT!!!!"
    puts "/"* 50
    puts test.access_token
    puts "/"* 50
  end

  def self.run_all
    self.users
    self.quests
    self.npcs
    self.errands
    self.items
    self.equips
    self.apikey
  end
end

BasicSeeder.run_all

