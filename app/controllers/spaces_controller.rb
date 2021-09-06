class SpacesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def list
        @spaces = current_user.spaces.order(id: :desc)
    end

    def new
        # @space = Space.new
        @space = current_user.spaces.new
        render layout: "newspace"
    end

    def create        
        # @space = Space.new(space_params)
        @space = current_user.spaces.new(space_params)

        if @space.save
            redirect_to stork_step2_path
        else
            flash[:notice] = "新增失敗"
            render :new
        end

    end

    def update
        @space = space_find_id
        
        if @space.update(space_params_update)
            flash[:notice] = "編輯成功"
            redirect_to stork_list_path 
        else
            flash[:notice] = "編輯失敗"
            render :edit
        end
    end


private
    def space_params
        params.require(:space).permit(:name, :icon)
    end

    def space_params_update       
        params.require(:space).permit(:name, :icon, :created_by)
    end

    def space_find_id
        @space = Space.find_by(id: params[:id])
    end
end