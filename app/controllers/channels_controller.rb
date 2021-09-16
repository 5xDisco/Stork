class ChannelsController < ApplicationController
  before_action :find_user_channel, only: [:show, :leave, :update, :destroy, :edit, :setting]
  before_action :find_space_user_channel, only: [:show]
  before_action :find_user_spaces, only: [:show]
  before_action :set_space, only:[:show]
  
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
      redirect_to space_channel_path(id: public_channel)
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to space_channel_path(id: @channel.id)
    end
    @errors = @channel.errors.full_messages
  end


  def member
    channel = Channel.find(params[:id])
    if(channel.is_public == true)
      @members = Space.find(channel.space_id).users 
    else
      @members = channel.users
    end

    #UserChannel.where(channel_id: params[:id]).users
  end

  def memberadd
    @userchannel = UserChannel.new()
    # 這個空間底下的使用者
    @spaceusers = Channel.find(params[:id]).space.users.where.not(id: current_user.id)
  end

  def memberdoadd
    #還沒做完的部分，禮拜一繼續
    render json: params
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
    params.require(:channel).permit(:name, :description, :topic, :space_id, :is_public, :direct_message)
  end

  def find_space_user_channel
    space = Space.find(params[:space_id])
    @channels = []
    public_channel = space.channels.find_by!(is_public: true)
    @channels << public_channel
    all_channels = current_user.channels.where(space_id: space.id, direct_message: false)
    all_channels.each do |c|
      @channels << c
    end
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end


