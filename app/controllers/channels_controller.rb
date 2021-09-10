class ChannelsController < ApplicationController
  before_action :find_user_channel, only: [:show, :leave, :update, :destroy, :edit, :setting]
  before_action :find_space_user_channel, only:[:show]
  before_action :find_user_spaces, only:[:show]
  def show
  end

  def leave
  end

  def edit
  end

  def setting
  end

  def create
    @channel = current_user.channels.new(channel_params);
    
    if(current_user.save)
      redirect_to space_channel_path(id: @channel.id)
    end
    @errors = @channel.errors.full_messages 
  end

  def new
    @channel = current_user.channels.new 
    @channel.space_id = params[:space_id]
    @channel.is_public = false
  end

  def destroy
    space = Space.find(params[:space_id])
    public_channel = space.channels.find_by!(is_public: true)
    if(@channel.destroy)
      #導向不能刪的那一個
      redirect_to space_channel_path(id:public_channel)
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to space_channel_path(id: @channel.id)
    end
    @errors = @channel.errors.full_messages
  end


  def member
    @members = User.all; #這邊先撈假資料
  end

  private
  #先準備好到時改
  def find_user_channel
    space = Space.find(params[:space_id])
    @channel = space.channels.find_by!(is_public: true) 
    @channel.id == params[:id].to_i ? @channel : @channel = current_user.channels.find(params[:id]) 
  end

  def find_user_spaces
    @spaces = current_user.spaces
  end
  
  def channel_params
    params.require(:channel).permit(:name, :description, :topic, :space_id, :is_public)
  end

  def find_space_user_channel
    space = Space.find(params[:space_id])
    @channels = []
    public_channel = space.channels.find_by!(is_public: true)
    @channels << public_channel
    all_channels = User.find_by(id:current_user.id).channels.where(space_id:space.id)
    all_channels.each do |c|
      @channels << c
    end
  end
end


