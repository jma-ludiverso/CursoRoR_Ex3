class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, except: [:index, :show]

  def require_login	
    unless !!session[:user_id]      
      redirect_to root_url
    end
  end

end
