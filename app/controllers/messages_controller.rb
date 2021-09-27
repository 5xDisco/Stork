class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: [:create]
  before_action :reply_message, only: [:reply]


  def create
    @message = @channel.messages.create(message_params)
    MessageChannel.broadcast_to @channel, message: render_to_string(@message)
    UnreadsChannel.broadcast_to @channel, {}
  end

  def reply
    @channel = @message.channel
    if @channel.direct_message
    receiver = @channel.name.split(":") - ["DM", "#{current_user.id}"]
    receiver_id = receiver[0].to_i
    @receiver = User.find(receiver_id)
    @receiver
    end
  end

  private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def reply_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
