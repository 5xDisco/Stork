class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_channel, only: [:show, :leave, :update, :destroy, :edit, :setting]
  before_action :find_space_user_channel, only: [:show]
  before_action :find_user_spaces, only: [:show]
  before_action :set_space, only:[:show]
  
  def show
    @spaces = current_user.spaces
    spaces = []
      @spaces.each do |s|
        spaces << s.channels.public_channels
      end
      @channels = spaces.flatten
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

    space = current_user.spaces.find(params[:space_id])
    @channel = current_user.channels.new(space: space, is_public: false)
  end

  def destroy
    space = current_user.spaces.find(params[:space_id])
    public_channel = space.channels.find_by!(is_public: true)
      #導向不能刪的那一個
    if(@channel.destroy)
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to space_channel_path(id: @channel.id)
    end
    @errors = @channel.errors.full_messages
  end

  def member
    channel = current_user.channels.find(params[:id])

    if(channel.is_public)
      @members = current_user.spaces.find(channel: channel).users
    else
      @members = channel.users
    end
    #UserChannel.where(channel_id: params[:id]).users
  end


  def memberadd
    @userchannel = UserChannel.new
    # 這個空間底下的使用者
    @spaceusers = Channel.find(params[:id]).space.users - [current_user]
  end

  def memberdoadd
    # TODO: 還沒做完的部分，禮拜一繼續
    render json: params
  end

  private
  # TODO: 先準備好到時改
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
    all_channels = current_user.channels.where(space: space, direct_message: false)
    all_channels.each do |c|
      @channels << c
    end
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
