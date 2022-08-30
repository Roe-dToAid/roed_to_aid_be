class Api::V1::AuthorizedClinicsController < ApplicationController
  def index
    render json: AuthorizedClinicSerializer.new(AuthorizedClinic.all)
  end

  def show
    state = State.find_by(abbreviation: params[:state_id])
    if state
      render json: AuthorizedClinicSerializer.new(state.authorized_clinics)
    else
      error_message = { Abbreviation: ['is invalid'] }
      error_handler(error_message)
    end
  end
end
