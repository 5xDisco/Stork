class ChannelMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChannelMessagesChannel:#{params[:channel_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end

