class UnreadsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    @user_channel = current_user.user_channels.find_by(channel_id: params["channel_id"])
    @channel = @user_channel.channel
    stream_for @channel
  end

  def unsubscribed
    stop_all_streams
  end
end