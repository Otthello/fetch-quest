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
      lat: "",
      lng: "",
      npc_id: 1,
      hero_id: 1,
      completed: false
    }
    p "params"
    p params
    p "storing lat"
    errand_info[:lat] = params[:latitude]
    p "stored lat"
    p "storing lng"
    errand_info[:lng] = params[:longitude]
    p "stored lng"
    p "creating errand obj"
    @errand = Errands.new(errand_info)
    p "errand: #{@errand}"
    if @errand.save
      p "sending 200"
      status 200
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
