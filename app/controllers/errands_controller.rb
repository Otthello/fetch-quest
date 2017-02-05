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
    @errand = Errand.new(errand_info)
    if @errand.save
      p "sending 200"
      render nothing: true, status: :ok
    else
      p "sending 422"
      status 422
    end
  end

  def cors_header_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
