class SharePostMailer < ApplicationMailer


  def new
    @user = user
    @post = Post.find(params[:id])
  end

  def share(post, user, email)
    @post = post
    @user = user
    @email = email
    mail(to: @email, subject: "#{@user} thought you would like to see this blog post from Trikke and Turf!")
  end

  private

  def share_params
    params.permit(params[:share][:user], params[:share][:email])
  end

end
