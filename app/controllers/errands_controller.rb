class ErrandsController < ApiController
  before_filter :cors_header_check
  def index
    errands = Errands.all
    render json: {status: 'SUCCESS', message: 'Loaded all errands', data: errands}, status: :ok
  end

  def create
    errand_info = {
      task: ['Eat a ', ["bagel","sandwich","pile of nails", "bag of salt"].sample].join(''),
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: false
    }
    p "params"
    p params
    p "lat"
    p params[:coords][:latitude]
    p "longe"
    params[:coords][:longitude]
    errand_info[:lat] = params[:coords][:latitude]
    errand_info[:lng] = params[:coords][:longitude]
    @errand = Errands.new(errand_info)
    if @errand.save
      status 200
    else
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
