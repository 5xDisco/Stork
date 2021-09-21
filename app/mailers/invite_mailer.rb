class InviteMailer < ApplicationMailer
    def invite(user: nil, email: nil)
        if user 
        @user = user.email
        mail to: @user.email.to_s, subject:"邀請你加入Stork的行列"
        else
        @user = email
        mail to: email.to_s, subject:"邀請你加入Stork的行列"
        end
    end
end
