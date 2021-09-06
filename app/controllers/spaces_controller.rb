class SpacesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def list
        @spaces = current_user.spaces.order(id: :desc)
    end

    def new
        # @space = Space.new
        @space = current_user.spaces.new
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

    def edit
        @space = space_find_id
    end

    def update
        @space = space_find_id
        
        if @space.update(space_params_update)
            flash[:notice] = "編輯成功"
            redirect_to "/list" 
        else
            flash[:notice] = "編輯失敗"
            render :edit
        end
    end

    def destroy
        @space = space_find_id
        @space.destroy
        flash[:notice] = "刪除了"
        redirect_to "/list" 
    end

private
    def space_params
        if params[:space][:created_by].empty?
            params[:space][:created_by] = current_user.id
        params.require(:space).permit(:name, :icon, :created_by)
        end
    end

    def space_params_update       
        params.require(:space).permit(:name, :icon, :created_by)
    end

    def space_find_id
        @space = Space.find_by(id: params[:id])
    end
end