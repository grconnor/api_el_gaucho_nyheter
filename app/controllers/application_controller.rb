class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?


  def error_message(errors)
    error_message = errors.full_messages.to_sentence

    render json: { message: error_message }, status: 422
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:teaser, :location, :image])
  end
end
