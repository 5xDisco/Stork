class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    private
    # Overwriting the sign_out redirect path method
    def after_sign_in_path_for(resource)
        list_path
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end


    # def destroy
    #     redirect_to logout_path
    # end

end
