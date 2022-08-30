class Api::V1::ResourcesController < ApplicationController
  def index
    render json: ResourceSerializer.new(Resource.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    if state
      render json: ResourceSerializer.new(state.resources)
    else
      error_message = { Abbreviation: ['is invalid'] }
      error_handler(error_message)
    end
  end
end
