class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # protect_from_forgery with: :null_session
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    private
    # Overwriting the sign_out redirect path method
    def after_sign_in_path_for(resource)
        root_path
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end

	def record_not_found
		render file: "public/404.html", status: :not_found
	end
end
