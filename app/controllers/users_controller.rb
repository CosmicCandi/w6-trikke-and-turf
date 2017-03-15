class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :email, :image, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def require_owner
    unless @user == current_user
      redirect_to :root
    end
  end

end
