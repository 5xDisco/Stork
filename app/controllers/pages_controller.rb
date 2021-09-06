class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def home
    end

    def step1
        # @space = Space.new
        @space = current_user.spaces.new
    end

    def step2
        @space = Space.last[:name]
        @channel = current_user.channels.new();
    end

    def step3
        @space = Space.last[:name]
        @channel = current_user.channels.create(channel_params);
        @channelName = Channel.last[:name]
    end


    def show
        space_find_id
    end

    def list
        # @spaces = Space.where(created_by: current_user.id).order(id: :desc)
        @spaces = current_user.spaces.order(id: :desc)
    end

    def edit
        @space = space_find_id
    end

    def destroy
        @space = space_find_id
        @space.destroy
        flash[:notice] = "刪除了"
        redirect_to root_path 
    end

    private
    def space_params
        params.require(:space).permit(:name, :icon, :user_id)
    end

    def space_find_id
        # byebug
        @space = Space.find_by(id: params[:id])
    end

    def channel_params
        params.require(:channel).permit(:name, :description, :status, :topic)
    end
end



