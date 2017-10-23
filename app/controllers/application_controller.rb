class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
  private
  
  def require_user_logged_in
    unless logged_in?
        redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
  end
  
  def correct_user
    @micropost = current_user.tasks.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
