class ApplicationController < ActionController::API
  before_action :api_key_verification

  protect_from_forgery with: :null_session

  def api_key_verification
    user ||= User.find_by(token: params[:api_key])
    unless user
      error_message = { api_key: ['is invalid'] }
      error_handler(error_message, :unauthorized)
    end
  end

  def error_handler(error_message, status = :bad_request)
    response_hash = ErrorSerializer.format_error(error_message)
    render json: response_hash, status: status
  end
end
