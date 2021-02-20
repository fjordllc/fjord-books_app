# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address#strong-parameters
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action do
    # I18n.locale = :en
    I18n.locale = :ja
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[postal_code address self_introduction email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
