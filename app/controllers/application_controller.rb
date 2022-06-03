# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email postal_code address information])
  end
end
