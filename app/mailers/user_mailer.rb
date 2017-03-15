class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the Trikke and Turf blogosphere!")
  end

end
