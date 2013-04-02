class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
    if params[:set_locale]
      redirect_to login_url(:locale=>params[:set_locale])
    end
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to events_path
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end

end
