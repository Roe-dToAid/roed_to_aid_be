class Api::V1::ResourcesController < ApplicationController
  def index
    render json: ResourceSerializer.new(Resource.all)
  end
end