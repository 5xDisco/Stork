class InviteMailer < ApplicationMailer
    def invite(invite = nil, email = nil)
        if email != nil
            @email = email
        else
            if invite != nil
            @email = User.find(invite.user_id).email
            end
        end
        mail to: @email.to_s, subject:"邀請你加入Stork的行列"
    end
end
