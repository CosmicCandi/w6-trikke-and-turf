class PostsController < ApplicationController

before_action :find_post, only: [:edit, :show, :update]

  def index
    @post = Post.all.order(created_at: :desc).first
    @posts = Post.all.order(created_at: :desc).offset(1).first(4)
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.order(created_at: :desc).where("id != ?", @post.id).first(4)
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:title, :body, :photo)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
