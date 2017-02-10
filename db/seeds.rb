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

  BasicSeeder.apikey

module DemoSeeder

def self.quests
  Quest.create(hook: "The village elder has been poisoned! We need ten mushrooms for the antidote", description:"Please gather them for us!", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "The goblins have stolen all of our crops!", description: "Thwomp the goblins", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "A new shovel master has arisen to hide the almight shovel", description: "Return the shovel and bring peace to the land", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "Too many birds. Why?", description: "Investigate birds", icon_url: "http://i.imgur.com/5CRbir2" )
  Quest.create(hook: "Danger's afoot", description: "Investigate", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Solve the wizard's riddle", description: "This wizard's got a lot of time on his hands", icon_url: "http://i.imgur.com/5CRbir2" )
  Quest.create(hook: "Kobolds are eating all the cows!", description: "Save the cows!", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "Risk it", description: "Get the biscuit", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "I'm not going to lie, I just need you to fetch me some rocks", description: "Pick up some rocks", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "Razalax, the Elder Brain has opened a portal to the underdark and his minion's are spilling out", description: "Close Razalax's portal.", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Even more skeletons loose than the first time", description: "We seriously have a very bad skeleton problem", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "Abandon all hope, ye who enter here", description: "Abandon... hope?", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "A spooky ghost tells you that he won't be free until his body is properly buried.", description: "Bury this spooky ghost's body.", icon_url: "http://i.imgur.com/5CRbir2" )
  Quest.create(hook: "I'm just saying, wouldn't it look a lot nicer around here with some tree branches? I feel like this room needs some tree branches.", description: "Collect tree branches. It's important!", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "Write this seed file there are so many seeds", description: "Write quest and NPC seed file.", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Grizbane the bridge troll lost his bridge and has become depressed and agressive", description: "Find Grizbane a new bridge", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "You've been challenged to a slam dunking contest." description: "Slam that dunk!!!", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "An angry Beholder is terrorizing the countryside. I don't know if you know this, but beholder's are like, CR 15. I know you're a pro but... I'm just saying.", description: "Kill the beholder.", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Something ancient and evil slumber's here", description: "???", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Our mana battery broke down. Can you fetch us some parts?", description: "Fetch some parts for the mana battery", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "A rock golem's been elbow dropping townspeople! He's upset because no one appreciate's his cooking", description: "Smell what the Rock is cookin'", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "A mysterious stranger challenges you to a game of chess.", description: "Get whooped by this mysterious stranger", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "We've angered the gods! Please save us!", description: "Appease the gods", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Meet some strangers in a tavern for a very vague, low level quest.", description: "You meet in a tavern.", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "I'm so tired.", description: "Sleep when you're dead.", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "Grandpa's all out of cold medicine.", description: "Get grandpa his cold medicine.", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "Do you ever think, like, hey man, what's over that mountain over there?", description: "Check out what's over that mountain", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "Hoooo boy this really hurts. Can you pull this out? I mean, that does not belong there", description: "Pull it out.", icon_url: "http://i.imgur.com/XYFvIcU.png")
  Quest.create(hook: "I'm just a small town girl, living in this lonely cave. Can you please take me back to my small town?", description: "Take this small town girl back to her town.", icon_url: "http://i.imgur.com/iTszqmw.png")
  Quest.create(hook: "A mean dragon is just flying saying mean things to people. Is there anything you can do about this?", description: "Ask this dragon to stop berating people", icon_url: "http://i.imgur.com/5CRbir2")
  Quest.create(hook: "GOBLINS", description: "There are in fact goblins.", icon_url: "http://i.imgur.com/EDh6ney")
  Quest.create(hook: "That is a big bee!", description: "Bring me its honey!", icon_url: "http://i.imgur.com/1tjHokx")
  Quest.create(hook: "That skeleton has walked by confused twice in 5 minutes", description: "Check to make sure he doesn't need directions!", icon_url: "http://i.imgur.com/kCAUq0E")
end

def self.items
  seed_items = [{image_url: "http://i.imgur.com/GACL0M6.png", description: "They're... useful for carrying things?", rarity: 1, slot: 3, name: "Cargo Shorts"},{image_url: "http://i.imgur.com/kSeCDQV.png", description: "Such plaid", rarity: 3, slot: 3, name: "Tartan Kilt"},{image_url: "http://i.imgur.com/45Blpg9.png", description: "So bright you need shades", rarity: 200, slot: 3, name: "Gold parachute pants"},{image_url: "http://i.imgur.com/e4FwiHM.png", description:"armored pants protect unarmored legs", rarity: 1, slot: 3, name: "Plate pants"},{:slot=>1, :rarity=>2, :image_url=>"http://i.imgur.com/9jqJu7s.png", :description=>"Sweet hat brah", :name=>"Pointy hat"}, {:slot=>2, :rarity=>nil, :image_url=>"http://d11wbxl9l7koq0.cloudfront.net/ioi-outputs/f77c3fba7a5e83d46653e63e1a839548-result.png", :description=>nil, :name=>"mine-chest"}, {:slot=>1, :rarity=>nil, :image_url=>"http://piq.codeus.net/static/media/userpics/piq_48303_400x400.png", :description=>nil, :name=>"itsa me"}, {:slot=>1, :rarity=>nil, :image_url=>"https://www.animepoko.com/images/product/anime-goods/beanie-mega-man-8-bit-mega-man.jpg", :description=>nil, :name=>"mega"}, {:slot=>1, :rarity=>nil, :image_url=>"https://t2.rbxcdn.com/49683dc4336852f60d8375983ab488dc", :description=>nil, :name=>"topper"}, {:slot=>1, :rarity=>nil, :image_url=>"https://rlv.zcache.ca/8_bit_retro_cardinal_trucker_hat-r0330fbeade2c499ebeadca0c87b498c7_v9wfy_8byvr_324.jpg", :description=>nil, :name=>"cardinals"}, {:slot=>1, :rarity=>nil, :image_url=>"http://rs492.pbsrc.com/albums/rr282/xLaziiYukii/AoiMiku%20Items/Wizardhatouo.png~c200", :description=>nil, :name=>"magic"}, {:slot=>2, :rarity=>4000, :image_url=>"http://i.imgur.com/nRzjUsJ.png", :description=>"Forged in florida...", :name=>"flaminco armor"}, {:slot=>2, :rarity=>4000, :image_url=>"http://i.imgur.com/FyVJAJQ.png", :description=>"AHGHGHGHG!", :name=>"screaming lazer armor"}, {:slot=>2, :rarity=>4000, :image_url=>"http://i.imgur.com/8GJYlp0.png", :description=>"Fly into your dreams", :name=>"rainbow dream armor"}]
  seed_items.each{|item| Item.create(item)}
end

def self.npcs
  instructor_npcs = [{avatar_url: "http://i.imgur.com/sDwHNBN.png", name: "Ellie"}, {avatar_url: "http://i.imgur.com/bZfRiKr.png", name: "Pete"}, {avatar_url: "http://i.imgur.com/E1jPcfo.png", name: "Avner"}, {:name=>"Ken", :avatar_url=>"http://i.imgur.com/DWTH8wm.png"}, {:name=>"Matt", :avatar_url=>"http://i.imgur.com/CQFyebm.png"}, {:name=>"Duke", :avatar_url=>"http://i.imgur.com/7xGHEti.png"}]
  instructor_npcs.each{|npc| Npc.create(npc)}
end

def self.users
  demo_user_details = {
    username: "finaldemo",
    password: "password",
    email: "final@demo.com"
  }
  User.create(demo_user_details);
end

def self.errands
  # Add specific errands for nice opening map in demo
  # Errand.create()
  # Errand.create()
  # Errand.create()
end
end


# Npc.all.collect{|x| {name: x.name, avatar_url: x.avatar_url}}
# Item.all.collect{|x|{slot: x.slot, rarity: x.rarity, image_url: x.image_url, description: x.description, name: x.name}

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


