class HomesController < ApplicationController
    def index
        if login_in?
            has_space = current_user.spaces.count
            if(has_space > 0)
                redirect_to list_path
            else
                redirect_to new_space_path
            end
        else
            redirect_to new_user_session_path
        end 
    end
end
