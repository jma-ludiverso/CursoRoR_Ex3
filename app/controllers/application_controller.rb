class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, except: [:index, :show]
  before_filter :set_locale
  helper_method :user_logged?

  def require_login	
    unless user_logged?
      redirect_to root_url
      return       
    end
  end

  def user_logged?
    session[:user_id].present?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end 

end
