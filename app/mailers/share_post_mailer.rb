class SharePostMailer < ApplicationMailer


  def new
    @user = User.new
    @post = Post.find(params[:id])
  end

  def share(share_params)
    @user = user
    @email = email
    mail(to: @email, subject: "#{@user} thought you would like to see this blog post from Trikke and Turf!")
  end

  private

  def share_params
    params.permit(:user, :email, :post_id)
  end

end
