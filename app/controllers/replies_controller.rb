class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @reply = @message.replies.create(message_params)
    # MessageChannel.broadcast_to @reply, message: render_to_string(@reply)
  end

  private

  def set_message
    @message = current_user.messages.find(params[:message_id])
  end

  def reply_params
    params.require(:replies).permit(:content).merge(user: current_user)
  end
end
