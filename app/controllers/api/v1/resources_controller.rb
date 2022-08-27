class Api::V1::ResourcesController < ApplicationController
  def index
    state = State.find_by(abbreviation: params[:state_id])
    render json: ResourceSerializer.new(state.resources)
  end
end
