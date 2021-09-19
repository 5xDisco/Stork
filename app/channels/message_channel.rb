class MessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "MessageChannel:#{params[:channel_id]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def touch
    @user_channel.touch(:last_read_at)
  end
end

