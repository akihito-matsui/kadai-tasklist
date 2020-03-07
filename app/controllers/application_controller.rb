class ApplicationController < ActionController::Base
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def logged_in?
    !!current_user
  end
  
end
