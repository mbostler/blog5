class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.where( "UPPER(name)=?", params[:name].upcase ).first

    begin
      user = user && user.authenticate( params[:password] )
    rescue Login::TooManyFailedLoginAttemptsError => ex
      UserMailer.too_many_login_attempts_notification( ex ).deliver
      flash.now.alert = "Error - too many login attempts."
      render :new and return      
    end
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome #{user.name}, you are now logged in."
    else
      flash.now.alert = "Invalid login credentials. Please try again."
      render :new
    end
  end
  
  def destroy
    user_name = current_user.name
    session[:user_id] = nil
    redirect_to root_path, notice: "#{user_name} logged out successfully."
  end
end
