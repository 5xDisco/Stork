class DirectMessagesController < ApplicationController
  before_action :find_space_user_channels
  before_action :find_user_spaces
  before_action :set_space
  before_action :find_lobby_channel
  before_action :find_public_channel

  def show
    users = [current_user, User.find(params[:id])]
    @recipient = User.friendly.find(params[:id])
    @channel = Channel.direct_message_for_users(users, @space.id)
    @messages = @channel.messages
    
    @user_channel = current_user.user_channels.find_by(channel: @channel)
    @last_read_at = @user_channel&.last_read_at || @channel.created_at
    @user_channel&.touch(:last_read_at)

    render "channels/show"
  end

  private

  def find_user_spaces
    @spaces = current_user.spaces
  end

  def find_space_user_channels
    space = Space.friendly.find(params[:space_id])
    @channels = current_user.channels.where(space_id: space.id, direct_message: false)
  end

  def set_space
    @space = current_user.spaces.friendly.find(params[:space_id])
  end

  def find_lobby_channel
    @lobby_channel = Space.friendly.find(params[:space_id]).channels.find_by(is_public: 'lobby_channel')
  end

  def find_public_channel
    spaces = current_user.spaces
    space_public_channels = []
    @spaces.each do |space|
      space_public_channels << space.channels.lobby_channels
    end
    @space_public_channels = space_public_channels.flatten
  end

end  