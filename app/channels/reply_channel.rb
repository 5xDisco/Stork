class ReplyChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "ReplyChannel:#{params[:channel_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end