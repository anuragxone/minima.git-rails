# typed: true

class ApplicationController < ActionController::API
  before_action
  include ActionController::MimeResponds
  respond_to :json

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, user: [ :email, :password ])
  end
end
