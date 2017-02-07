class TestSeeder
  attr_reader :key, :token, :errand_id,
              :user_id, :quest_id, :npc_id,
              :item_id, :equip_id

  def run_all
    quests
    npcs
    users
    items
    errands
    equips
    apikey
  end

  private

  def users
    user_info = {
      username: "VargouilleSupreme",
      avatar_url: "http://i.imgur.com/9zxJla4.png",
      email: "test@test.com",
      password:"test"
    }
    user = User.new(user_info)
    if user.save
      @user_id = user.id
      @token = user.auth_token
    else
      raise "Something wrong in seeding users"
    end
  end

  def npcs
    npc_info = {
      avatar_url: "http://i.imgur.com/DWTH8wm.png",
      name: "Ken the Paladin"
    }
    npc = Npc.new(npc_info)
    if npc.save
      @npc_id = npc.id
    else
      raise "something wrong in Npc seeding"
    end
  end

  def quests
    quest_info = {
      icon_url: "http://i.imgur.com/NlZj5vv.gif",
      hook: "I don't like that castle.",
      description: "Ken doesn't like that castle. Destroy it and he'll give you sweet loot"
    }
    quest = Quest.new(quest_info)
    if quest.save
      @quest_id = quest.id
    else
      raise "something wrong in Quest seeding"
    end
  end

  def items
    item_info = {
      slot: 1,
      rarity: 2,
      image_url: "http://i.imgur.com/9jqJu7s.png",
      description: "Sweet hat brah",
      name: "Pointy hat"
    }
    item = Item.new(item_info)
    if item.save
      @item_id = item.id
    else
      raise "something breaking in Item seeding"
    end
  end

  def errands
    errand_info = {
      task: "Buy snacks from target",
      lat: "41.876953",
      lng: "-87.655314",
      quest_id: @quest_id,
      npc_id: @npc_id,
      hero_id: @user_id,
      completed: 0
    }
    errand = Errand.new(errand_info)
    if errand.save
      @errand_id = errand.id
    else
      raise "something wrong in errand seeding"
    end
  end

  def equips
    equip_info = {
      owner_id: @user_id,
      lootable_id: @item_id,
      lootable_type: 'Item'
    }
    equip = Equip.new(equip_info)
    if equip.save
      @equip_id = equip.id
    else
      raise "something breaking in equip seeding"
    end
  end

  def apikey
    apikey = Apikey.new(email: "test@tester.com", domain: "test.com")
    if apikey.save
      @key = apikey.access_token
    else
      raise "something very wrong in apikey seeding"
    end
  end
end
