class Api::V1::MisinformationCentersController < ApplicationController
  def index
    render json: MisinformationCenterSerializer.new(MisinformationCenter.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    if state
      render json: MisinformationCenterSerializer.new(state.misinformation_centers)
    else
      error_message = { Abbreviation: ['is invalid'] }
      error_handler(error_message)
    end
  end
end
