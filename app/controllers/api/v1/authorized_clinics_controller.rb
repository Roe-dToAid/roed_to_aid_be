class Api::V1::AuthorizedClinicsController < ApplicationController
  def index
    render json: AuthorizedClinicSerializer.new(AuthorizedClinic.all)
  end
end