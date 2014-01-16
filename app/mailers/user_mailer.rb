class UserMailer < ActionMailer::Base
  default from: "sachinidify@gmail.com"
   
  def welcome_email(user,token)
     @user = user
     @token = token
	   mail(:to => @user.email, :subject => @user.subject)
  end
end
