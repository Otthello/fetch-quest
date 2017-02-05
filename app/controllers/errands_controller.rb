class ErrandsController < ApiController
  include QuestsHelper
  include NpcsHelper
  before_filter :cors_header_check

  def index
    p "ENTER INDEX"
    errands = Errand.first
    p "errand"
    render json: {status: 'SUCCESS', message: 'Loaded all errands', data: errands}, status: :ok
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

  def cors_header_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
