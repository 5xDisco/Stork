class InviteMailer < ApplicationMailer
    def invite(user)
        @user = user
        mail to: @user.email.to_s, subject:"邀請你加入Stork的行列"
    end
end
