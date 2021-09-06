<<<<<<< HEAD
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    private
    # Overwriting the sign_out redirect path method
    def after_sign_in_path_for(resource)
        stork_list_path
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referrer
    end

end
=======
class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
end
>>>>>>> 8826ab7... 新增假刪除功能
