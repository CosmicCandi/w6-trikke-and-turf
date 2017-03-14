class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_posts

  def get_posts
    @posts = Post.all.order(created_at: :desc).first(4)
  end

end
