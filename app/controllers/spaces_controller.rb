class SpacesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def list
        @spaces = Space.where(created_by: current_user.id).order(id: :desc)
        # @spaces = Space.all.order(id: :desc).where(created_by: current_user.id)
        # @spaces = Space.includes(:user).order(id: :desc)
    end


    def new
        @space = Space.new
    end


    def create        
        @space = Space.new(clean_params)
        # @space = current_user.spaces.new
        # Rails.logger.info "params: #{params[:space], #{@space.insect}}"
        # render clean_params.inspect
        # byebug
        if @space.save
            redirect_to '/crt_channel'
        else
            flash[:notice] = "新增失敗"
            render :new
        end
    end


    def show
        @space = Space.find_by(id: params[:id])
    end
    

    def edit
        @space = Space.find_by(id: params[:id])
    end

    def update
        @space = Space.find_by(id: params[:id])
        
        if @space.update(clean_params)
            flash[:notice] = "編輯成功"
            redirect_to "/list" 
        else
            flash[:notice] = "編輯失敗"
            render :edit
        end
    end

    def destroy
        @space = Space.find_by(id: params[:id])
        @space.destroy
        flash[:notice] = "刪除了"
        redirect_to "/list" 
    end


private
    def clean_params
        if params[:space][:created_by].empty?
            params[:space][:created_by] = current_user.id
        params.require(:space).permit(:name, :icon, :created_by)
        end
    end

    def find_user_space
        @space = current_user.find(params[:note_id])
    end

end