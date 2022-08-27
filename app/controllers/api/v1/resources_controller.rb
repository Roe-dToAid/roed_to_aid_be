class Api::V1::ResourcesController < ApplicationController
  def index
    render json: ResourceSerializer.new(Resource.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    render json: ResourceSerializer.new(state.resources)
  end
end
