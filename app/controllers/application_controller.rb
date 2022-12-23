# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # deviseで使われているstrong_parameterを上書き
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_num, :address, :introduce])
  end
end
