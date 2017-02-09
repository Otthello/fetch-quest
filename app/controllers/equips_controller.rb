class EquipsController < ApiController
  include UsersHelper
  before_action :require_login

  def index
    user = get_user
    puts user
    if user
      puts "User found"
      items = user.items

      if items
        puts "Items found"
        render json: {status: 'SUCCESS', message: 'Loaded all user equips', data: items}, status: :ok
      else
        puts "No equips"
        render nothing: true, status: :no_content
      end
    else
      puts "No user"
      render nothing: true, status: :bad_request
    end
  end

  def create
    user = get_user
    random_loot_id = Item.order("RANDOM()").first.id

    if user
      equip = Equip.new(owner_id: get_user.id,
                        lootable_type: "Item",
                        lootable_id: random_loot_id)
      if equip.save
        user.equips << equip
        puts "User #{user.username} has acquired #{Item.find(user.equips.last.lootable_id)}"

        render json: {status: 'SUCCESS', message: 'Equipped user with random loot.', data: user.equips.last}, status: :ok
      else
        puts "Loot was not equipped :("
        render nothing: true, status: :bad_request
      end
    else
      puts "Cannot find user"
      render nothing: true, status: :bad_request
    end
  end
end
