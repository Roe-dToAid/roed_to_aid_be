class Api::V1::StatesController < ApplicationController
  def index
    render json: StateSerializer.new(State.all)
  end

  def show
    state = State.find_by(abbreviation: params[:id])
    render json: StateSerializer.new(state)
  end
end
