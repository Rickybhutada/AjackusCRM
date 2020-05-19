class UserMailer < ApplicationMailer

  # Send welcome mail when user is created
  def welcome_mail(user)
    @user = user
    mail( :to => user.email,
          :cc => MAIL_CC,
          :subject => 'Thanks for connecting to Ajackus website' )
  end

end
