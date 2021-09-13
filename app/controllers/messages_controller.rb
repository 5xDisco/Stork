class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    redirect_to space_channel_path(@message.channel.space_id, @message.channel_id)
  end
  
  private 

  def message_params
    params.require(:message).permit(:content, :channel_id, :user_id)
  end
end
