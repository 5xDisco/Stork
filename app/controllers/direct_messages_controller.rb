class DirectMessagesController < ApplicationController
  before_action :find_space_user_channel
  before_action :set_space
  before_action :find_user_spaces

  def show
    users = [current_user, User.find(params[:id])]
    @recipient = User.find(params[:id])
    @channel = Channel.direct_message_for_users(users, @space.id)
    @messages = @channel.messages
    @user_channel = current_user.user_channels.find_by(channel_id: @channel.id)
    render "channels/show"
  end

  private

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

  def find_user_spaces
    @spaces = current_user.spaces
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end  