class ErrandsController < ApiController
  before_filter :cors_header_check

  def index
    p "ENTER INDEX"
    errands = Errand.first
    p "errand"
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
    errand_info[:lat] = params[:latitude]
    errand_info[:lng] = params[:longitude]
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
