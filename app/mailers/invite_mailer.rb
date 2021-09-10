class InviteMailer < ApplicationMailer
    def invite(user)
        @user = user
        mail to:@user .email, subject:"邀請你加入Stork的行列"
    end

    def create
        @user = User.new(user_params)
        if @user.save
            InviteMailer.invite(@user).deliver_now
            redirect_to(@user), notice: '已邀請新User'
        else 
            render :new
        end
    end
end