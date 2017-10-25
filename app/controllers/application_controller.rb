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
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favorites = user.favorite_microposts.count
    # @count_favorite_users = user.favorite_users.count
  end
end
