class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(params[:user_id]) if params[:user_id]
  end
  helper_method :current_user
end
