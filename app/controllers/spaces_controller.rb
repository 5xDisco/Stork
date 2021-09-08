class SpacesController < ApplicationController


    def list
        @spaces = Space.all
    end


    def new
        @space=Space.new
    end


    def create        
        @space=Space.new(clean_params)
        
        if @space.save
            redirect_to "/" 
        else
            flash[:notice] = "新增失敗"
            redirect_to "/" 
        end
    end


private
    def clean_params
        params.require(:space).permit(:name, :icon, :created_by)
    end

end
