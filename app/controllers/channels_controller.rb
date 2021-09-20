class ChannelsController < ApplicationController
  before_action :find_user_channel, only: [:show, :leave, :update, :edit, :setting, :member_add]
  before_action :find_space_user_channel, only: [:show]
  before_action :find_user_spaces, only: [:show]
  before_action :set_space, only:[:show]
  
  def show
    @user_channel = current_user.user_channels.find_by(channel: @channel)
    @last_read_at = @user_channel&.last_read_at || @channel.created_at
    @user_channel&.touch(:last_read_at)

    
  end

  def leave
  end

  def edit
    channel = Channel.find(params[:id])
    @members = channel.users
  end

  def setting
  end

  def create
      @channel = current_user.channels.new(channel_params);

      unless Space.find(params[:space_id]).channels.find_by(name: @channel.name)
        if(params[:is_public] == "public")
          @channel.is_public = 'public_channel'
        else
          @channel.is_public = 'private_channel'
        end
        if(current_user.save) 
          if(@channel.is_public == 'public_channel')
            space_users = Space.find(params[:space_id]).users
            space_users.each do |u|
              unless u.channels.find_by(space_id: params[:space_id], id: @channel.id)
                UserChannel.create(user_id: u.id, channel_id: @channel.id)
              end
            end
          end
          redirect_to space_channel_path(id: @channel.id)
        end
        @errors = @channel.errors.full_messages 
      end
      @errors = "已有此頻道不能同名"
  end

  def new
    @channel = current_user.channels.new 
    @channel.space_id = params[:space_id]
  end

  def destroy
    lobby_channel = current_user.channels.find_by(space_id: params[:space_id], is_public: 'lobby_channel')
     user_channel = UserChannel.find_by(user_id: current_user.id, channel_id: params[:id])
    if(user_channel.destroy) #退出頻道
      channel = Channel.find(params[:id])
      if channel.users.size == 0
        channel.destroy #剩一個人刪除頻道
      end
      #導向不能刪的那一個
      redirect_to space_channel_path(id: lobby_channel.id)
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
    if (channel.is_public == true)
      @members = Space.find(channel.space_id).users 
    else
      @members = channel.users
    end

    #UserChannel.where(channel_id: params[:id]).users
  end

  def member_add
    @userchannel = UserChannel.new()
    # 這個空間底下的使用者
    @spaceusers = Channel.find(params[:id]).space.users - [current_user]
  end

  def member_doadd
    invite_ids = params["user_channel"]["user_ids"]
    invite_ids.each do |id|
    end
    redirect_to space_channel_path(params[:space_id], params[:id])
  end

  def member_accept
    if user_signed_in?
      content = Invitation.find_by!(user_id: current_user.id)
      if(content)
        space_id = content.space_id
        channel_id = content.channel_id
        Invitation.destroy(content.id)
        redirect_to space_channel_path(space_id,channel_id)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  private
  #先準備好到時改
  def find_user_channel
    @channel = current_user.channels.find(params[:id])
  end

  def find_user_spaces
    @spaces = current_user.spaces
  end
  
  def channel_params
    params.require(:channel).permit(:name, :description, :topic, :space_id, :direct_message)
  end

  def find_space_user_channel
    space = Space.find(params[:space_id])
    @channels = current_user.channels.where(space_id: space.id, direct_message: false)
  end

  def set_space
    @space = current_user.spaces.find(params[:space_id])
  end
end


