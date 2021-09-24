class DirectMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_space_user_channel
  before_action :set_space
  before_action :find_user_spaces
  before_action :find_public_channel, only:[:show]

  def show
    users = [current_user, User.find(params[:id])]
    @recipient = User.find(params[:id])
    @channel = Channel.direct_message_for_users(users, @space.id)
    @messages = @channel.messages
    @user_channel = current_user.user_channels.find_by(channel_id: @channel.id)
    @lobby_channel = Space.find(params[:space_id]).channels.find_by(is_public: 'lobby_channel')

    render "channels/show"
  end

  private

  def find_space_user_channel
    space = Space.find(params[:space_id])
    @channels = []
    all_channels = current_user.channels.where(space_id: space.id, direct_message: false)
    all_channels.each do |c|
      @channels << c
    end
  end

  def find_user_spaces
    @spaces = current_user.spaces
  end

  def set_space
    @space = Space.find(params[:space_id])
  end

    private
    def find_public_channel
    spaces = current_user.spaces
    space_public_channels = []
      @spaces.each do |space|
        space_public_channels << space.channels.lobby_channels
      end
    @space_public_channels = space_public_channels.flatten
  end
end  