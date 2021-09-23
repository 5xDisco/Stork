class InviteMailer < ApplicationMailer
    require 'mailgun-ruby'
    def invite(user: nil, email: nil)
        if Rails.env.production?
            mg_client = Mailgun::Client.new(ENV["MAILGUN_API"])
            # Define your message parameters
            message_params =  { from: "serice@storkapp.tw",
                                to:   "#{user ? user.email : email}",
                                subject: "邀請你加入Stork的行列",
                                html: (render "./invite_mailer/invite")
                              }
            # Send your message through the client
            mg_client.send_message 'storkapp.tw', message_params
        else
            mail to: "#{user ? user.email : email}" , subject:"邀請你加入Stork的行列"
        end
    end
end
