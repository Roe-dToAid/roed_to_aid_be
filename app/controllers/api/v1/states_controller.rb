class Api::V1::StatesController < ApplicationController
  def index
    render json: StateSerializer.new(State.all)
  end

  def show
    state = State.find_by(abbreviation: params[:id])
    if state
      render json: StateSerializer.new(state)
    else
      error_message = { Abbreviation: ['is invalid'] }
      error_handler(error_message)
    end
  end
end
