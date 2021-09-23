class InviteMailer < ApplicationMailer
    require 'mailgun-ruby'
    def invite(user: nil, email: nil)
        # if Rails.env.production?
        #     mg_client = Mailgun::Client.new(ENV["MAILGUN_API"])
        #     # Define your message parameters
        #     message_params =  { from: "serice@storkapp.tw",
        #                         to:   "#{user ? user.email : email}",
        #                         subject: "邀請你加入Stork的行列",
        #                         html: (render "./invite_mailer/invite")
        #                       }
        #     # Send your message through the client
        #     result = mg_client.send_message('storkapp.tw', message_params).to_h!
        #     p result
        # else
        #     mail to: "#{user ? user.email : email}" , subject:"邀請你加入Stork的行列"
        # end
        mg_client = Mailgun::Client.new('key-0aff01fa06cf78120a636baadee62c74')
            # Define your message parameters
            message_params =  { from: "serice@storkapp.tw",
                                to:   "#{user ? user.email : email}",
                                subject: "邀請你加入Stork的行列",
                                html: (render "./invite_mailer/invite")
                              }
            # Send your message through the client
            result = mg_client.send_message('127.0.0.1:3000', message_params).to_h!
            p result
    end
end
