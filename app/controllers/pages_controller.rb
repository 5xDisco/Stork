class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home]
    before_action :find_space, only: [:show, :edit, :destory]

    def home
        # @spaces = Space.all
        @channels = Channel.public_channels
    end

    def step1
        # @space = Space.new
        @space = current_user.spaces.new
    end

    def step2
        @space = Space.last
        @channel = current_user.channels.new;
        @channel.space_id = @space.id
        pulic_space = Channel.create(name: "公開區", is_public: true, space_id: Space.last[:id]);
    end

    def step3
        @space = Space.last
        @channel = current_user.channels.create(channel_params);
        @channelName = Channel.last[:name]
    end


    def show
    end

    def list
        # @spaces = Space.where(created_by: current_user.id).order(id: :desc)
        @spaces = current_user.spaces.order(id: :desc)
        #@channel = current_user.spaces.channels(is_public: true);
        array = []
        @spaces.each do |s|
            array << s.channels.where(is_public: true)
        end

        @channels = Channel.public_channels

    end

    def edit
        @space = find_space
    end

    def destroy
        @space = find_space
        @space.destroy
        flash[:notice] = "刪除了"
        redirect_to root_path 
    end

    private
    def space_params
        params.require(:space).permit(:name, :icon, :user_id)
    end

    def find_space
        # byebug
        @space = Space.find_by(id: params[:id])

    end

    def channel_params
        params.require(:channel).permit(:name, :space_id);
    end
end
end
