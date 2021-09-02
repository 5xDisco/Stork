class ApplicationController < ActionController::Base
    # before_action :authenticate_user!

    private
    # Overwriting the sign_out redirect path method
    def after_sign_up_path_for(resource_or_scope)
        new_space_path
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end

end
