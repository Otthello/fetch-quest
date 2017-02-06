class ErrandsController < ApiController
  before_action :require_login
  include ErrandsHelper
  include QuestsHelper
  include NpcsHelper
  include UsersHelper

  def index
    user = get_user
    if user
      puts 'User found'
      if user.errands.length > 0
          puts 'Errands found'
        if params[:options] == 'location'
          puts 'Location option recognized'
          render json: {status: 'SUCCESS', message: 'Loaded all errands and locations', data: user.incompleted_errand_locations}, status: :ok
        else
          render json: {status: 'SUCCESS', message: 'Loaded all errands and quests', data: user.errands_and_quests}, status: :ok
        end
      else
        puts "Errands not found"
        render nothing: true, status: :bad_request
      end

    else
      puts 'User not found'
      render nothing: true, status: :bad_request
    end
  end

  def create
    user = get_user
    if user
      puts 'User found'

      errand_info_hash = {
        task: params[:task],
        quest_id: get_rand_quest.id,
        lat: params[:latitude],
        lng: params[:longitude],
        npc_id: get_rand_npc.id,
        hero_id: user.id,
        completed: false
      }

      puts ["Making a new errand with values:", "\n", "#{errand_info_hash}"].join("")
      errand = Errand.new(errand_info_hash)
      if errand.save
        puts "Saving valid errand"
        render nothing: true, status: :ok
      else
        puts "Failed #{errand.errors.full_messages}"
        render nothing: true, status: :bad_request
      end
    else
      puts 'User not found'
      render nothing: true, status: :bad_request
    end
  end

  def update
    user = get_user
    if user
      puts 'User found'
      errand = Errand.find_by(id: params[:id])

      if errand
        puts "Valid errand found"
        #Rich hates boolean values in SQL 0 for false, 1 for true
        errand.completed = 1
        errand.save

        puts "Updated errand to completed"
        render nothing: true, status: :ok
      else
        puts "Invalid errand #{errand.errors.full_messages}"
        render nothing: true, status: :bad_request
      end

    else
      puts 'User not found'
      render nothing: true, status: :bad_request
    end
  end


end
