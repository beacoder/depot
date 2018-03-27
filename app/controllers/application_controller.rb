class ApplicationController < ActionController::Base

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
end
