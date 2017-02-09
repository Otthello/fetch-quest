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

Quest.create(hook: "The village elder has been poisoned! We need ten mushrooms for the antidote", description:"Please gather them for us!", icon_url: "assets/gem.png")
Quest.create(hook: "The goblins have stolen all of our crops!", description: "Thwomp the goblins", icon_url: "assets/green_man.png")
Quest.create(hook: "A new shovel master has arisen to hide the almight shovel", description: "Return the shovel and bring peace to the land", icon_url: "assets/gem.png")
Quest.create(hook: "Too many birds. Why?", description: "Investigate birds", icon_url: "assets/wizard.png" )
Quest.create(hook: "Danger's afoot", description: "Investigate", icon_url: "assets/wizard.png")
Quest.create(hook: "Solve the wizard's riddle", description: "This wizard's got a lot of time on his hands", icon_url: "assets/wizard.png" )
Quest.create(hook: "Kobolds are eating all the cows!", description: "Save the cows!", icon_url: "assets/green_man.png")
Quest.create(hook: "Risk it", description: "Get the biscuit", icon_url: "assets/gem.png")
Quest.create(hook: "I'm not going to lie, I just need you to fetch me some rocks", description: "Pick up some rocks", icon_url: "assets/gem.png")
Quest.create(hook: "Razalax, the Elder Brain has opened a portal to the underdark and his minion's are spilling out", description: "Close Razalax's portal.", icon_url: "assets/wizard.png")
Quest.create(hook: "Even more skeletons loose than the first time", description: "We seriously have a very bad skeleton problem", icon_url: "assets/green_man.png")
Quest.create(hook: "Abandon all hope, ye who enter here", description: "Abandon... hope?", icon_url: "assets/gem.png")
Quest.create(hook: "A spooky ghost tells you that he won't be free until his body is properly buried.", description: "Bury this spooky ghost's body.", icon_url: "assets/wizard.png" )
Quest.create(hook: "I'm just saying, wouldn't it look a lot nicer around here with some tree branches? I feel like this room needs some tree branches.", description: "Collect tree branches. It's important!", icon_url: "assets/gem.png")
Quest.create(hook: "Write this seed file there are so many seeds", description: "Write quest and NPC seed file.", icon_url: "assets/wizard.png")
Quest.create(hook: "Grizbane the bridge troll lost his bridge and has become depressed and agressive", description: "Find Grizbane a new bridge", icon_url: "assets/green_man.png")
Quest.create(hook: "You've been challenged to a slam dunking contest." description: "Slam that dunk!!!", icon_url: "assets/gem.png")
Quest.create(hook: "An angry Beholder is terrorizing the countryside. I don't know if you know this, but beholder's are like, CR 15. I know you're a pro but... I'm just saying.", description: "Kill the beholder.", icon_url: "assets/wizard.png")
Quest.create(hook: "Something ancient and evil slumber's here", description: "???", icon_url: "assets/wizard.png")
Quest.create(hook: "Our mana battery broke down. Can you fetch us some parts?", description: "Fetch some parts for the mana battery", icon_url: "assets/wizard.png")
Quest.create(hook: "A rock golem's been elbow dropping townspeople! He's upset because no one appreciate's his cooking", description: "Smell what the Rock is cookin'", icon_url: "assets/gem.png")
Quest.create(hook: "A mysterious stranger challenges you to a game of chess.", description: "Get whooped by this mysterious stranger", icon_url: "assets/wizard.png")
Quest.create(hook: "We've angered the gods! Please save us!", description: "Appease the gods", icon_url: "assets/wizard.png")
Quest.create(hook: "Meet some strangers in a tavern for a very vague, low level quest.", description: "You meet in a tavern.", icon_url: "assets/wizard.png")
Quest.create(hook: "I'm so tired.", description: "Sleep when you're dead.", icon_url: "assets/gem.png")
Quest.create(hook: "Grandpa's all out of cold medicine.", description: "Get grandpa his cold medicine.", icon_url: "assets/wizard.png")
Quest.create(hook: "Do you ever think, like, hey man, what's over that mountain over there?", description: "Check out what's over that mountain", icon_url: "assets/green_man.png")
Quest.create(hook: "Hoooo boy this really hurts. Can you pull this out? I mean, that does not belong there", description: "Pull it out.", icon_url: "assets/gem.png")
Quest.create(hook: "I'm just a small town girl, living in this lonely cave. Can you please take me back to my small town?", description: "Take this small town girl back to her town.", icon_url: "assets/green_man.png")
Quest.create(hook: "A mean dragon is just flying saying mean things to people. Is there anything you can do about this?", description: "Ask this dragon to stop berating people", icon_url: "assets/wizard.png")

# Item.create(slot: 1, rarity: 2, image_url: , description: "This hat imbues you with a proximal knowledge of many things", name: "Hat of proximal knowledge" )
# Item.create(slot: 2, rarity: 1, image_url: , description: "These rags will offer you zero protection and make you look like garbage" , name: "Rags" )
# Item.create(slot: 3, rarity: 2, image_url: , description: "Performance optimizing gloves", name: "Gloves of Dexterity +10")
# Item.create(slot: 4, rarity: 2, image_url: , description: "These Sandals used to belong to a mysterious traveler who would show up in times of great danger. Otherwise, pretty normal sandals.", name: "Sandals of SpaceTime")
# Item.create(slot: 1, rarity: 2, image_url: , description: "A hat with a giant, brass clock hanging off of the front of it.", name: "SpaceTime hat" )
# Item.create(slot: 2, rarity: 2, image_url: , description: "Nyan nyan nyan nyan nyan", name: "NyanShell")
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )
# Item.create(slot: 1, rarity: 2, image_url: , description:, name: )


