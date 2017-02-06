class ErrandsController < ApiController

  include ErrandsHelper
  include QuestsHelper
  include NpcsHelper

  def index
    p "In Index"
    errands = get_user_errands
    # errands = User.first.errands
    p errands
    p "These are the errands for the user"
    if errands.length > 0
      render json: {status: 'SUCCESS', message: 'Loaded all errands', data: errands}, status: :ok
      # render json: {status: 'SUCCESS', message: 'Loaded all errands', data: errands}, status: :ok
    else
      p "sending 422"
      status 422
    end
  end

  def create
    p "Posting an errand"
    p "***** PARAMS *****"
    p params
    errand_info = {
      task: params[:task],
      quest_id: get_rand_quest.id,
      lat: params[:latitude],
      lng: params[:longitude],
      npc_id: get_rand_npc.id,
      hero_id: get_user.id,
      completed: false
    }

    p "** errand_info **"
    p errand_info
    errand = Errand.new(errand_info)
    if errand.save
      puts "Saving valid errand"
      render nothing: true, status: :ok
    else
      puts "Failed #{errand.errors.full_messages}"
      render nothing: true, status: :bad_request
    end
  end

  def update
    errand = Errand.find_by(id: params[:id])
    if errand
      errand.completed = 1
      errand.save
      puts "Updated errand to completed"
      render nothing: true, status: :ok
    else
      puts "Failed #{errand.errors.full_messages}"
      render nothing: true, status: :bad_request
    end
  end


end
