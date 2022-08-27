class Api::V1::AuthorizedClinicsController < ApplicationController
  def index
    render json: AuthorizedClinicSerializer.new(AuthorizedClinic.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    render json: AuthorizedClinicSerializer.new(state.authorized_clinics)
  end
end