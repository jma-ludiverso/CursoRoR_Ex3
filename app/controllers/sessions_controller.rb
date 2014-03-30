class SessionsController < ApplicationController
  skip_before_action :require_login

  def login
    if params[:par] == "destroy" 
      destroy 
    end
  end

  def create
  	user = User.find_by(email:params[:email])
  	if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
      redirect_to orders_path
  	else
  		flash.now.alert = "Invalid credentials"
  		render "login"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end

end