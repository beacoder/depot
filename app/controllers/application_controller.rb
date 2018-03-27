class ApplicationController < ActionController::Base

  # [122] update: set locale before any controller action
  # declare set_i18n_locale_from_params() to be called before any controller action
  before_action :set_i18n_locale_from_params

  # [108] update: check user authorization before any controller action
  # declare authorize() to be called before any controller action
  before_action :authorize

  protect_from_forgery with: :exception

  protected
  # [107] update: add function to check if user is authorized
  # if not, redirect to login page
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  # [121] update: add function to set locale from params
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
          "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
