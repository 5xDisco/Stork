class UserMailer < ActionMailer::Base
  
  default :from => "寄件人名字 <noreply@example.org>"

  def notify_comment(user, comment)
      @comment = comment
      mail(:to => user.email, :subject => "New Comment")
  end
end


#-----下方是原本的樣子-----

# class UserMailer < ApplicationMailer

#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.user_mailer.notify_comment.subject
#   #

#   def notify_comment
#     @greeting = "Hi"

#     mail to: "to@example.org"
#   end
# end
