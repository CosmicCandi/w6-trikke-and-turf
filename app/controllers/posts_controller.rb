class PostsController < ApplicationController

  def index
    @post_most_recent = Post.all.order(created_at: :desc).first
    @posts = Post.all.order(created_at: :desc).offset(1).first(4)
  end

  def show
    @post_most_recent = Post.find(params[:id])
    @posts = Post.all.order(created_at: :desc).where("id != ?", @post_most_recent.id).first(4)
  end

end
