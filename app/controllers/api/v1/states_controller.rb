# frozen_string_literal: true

module Api
  module V1
    class StatesController < ApplicationController
      def index
        render json: StateSerializer.new(State.all)
      end
    end
  end
end
