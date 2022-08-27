class Api::V1::MisinformationCentersController < ApplicationController
  def index
    render json: MisinformationCenterSerializer.new(MisinformationCenter.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    render json: MisinformationCenterSerializer.new(state.misinformation_centers)
  end
end
