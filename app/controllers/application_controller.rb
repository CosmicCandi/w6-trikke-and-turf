class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_posts

  helper_method :current_user

  private

  def get_posts
    @posts = Post.all.order(created_at: :desc).first(4)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
