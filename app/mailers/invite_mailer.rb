class InviteMailer < ApplicationMailer
    def invite(email)
        @email = email
        mail to: email, subject:"邀請你加入Stork的行列"
    end
end