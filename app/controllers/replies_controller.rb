class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @reply = @message.replies.create(reply_params)
    ReplyChannel.broadcast_to "ReplyChannel:#{@message.id}", message: render_to_string(@reply)
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end

  def reply_params
    params.require(:reply).permit(:content).merge(user: current_user)
  end
end
