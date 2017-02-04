class ErrandsController < ApplicationController
  def index
    @errands = Errands.all
    render json: @errands
  end

  def create
    errand_info = {
      task: ['Eat a ', ["bagel","sandwich","pile of nails", "bag of salt"].sample].join('')
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: false
    }
    errand_info[:lat] = params[:coords].latitude
    errand_info[:lng] = parrams[:coords].longitude
    @errand = Errands.new(errand_info)
    if @errand.save
      status 200
    else
      status 422
    end
  end
end
