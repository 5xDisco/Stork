class ChannelMessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "ChannelMessagesChannel:#{params[:channel_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end

