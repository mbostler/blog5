class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_admin_role
    ensure_role( :admin )
  end
  
  def ensure_role( role )
    if !!current_user && current_user.has_role?( role )
      return true
    else
      flash.alert = "Unauthorized action attempted."
      redirect_to root_url and return
    end    
  end
  
  private
  
  def current_user
    @current_user ||= User.find( session[:user_id] ) if session[:user_id]
  end
  helper_method :current_user
  
  def test_flash
    # flash.now[:notice] = "testing"
  end
end
