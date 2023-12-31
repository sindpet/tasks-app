class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  layout :layout_by_resource

  include Pagy::Backend

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def layout_by_resource
    if devise_controller? && action_name != "edit"
      "devise"
    else
      "application"
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @pagy_locale = I18n.locale
  end
end
