class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "MessageChannel:#{params[:channel_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end

