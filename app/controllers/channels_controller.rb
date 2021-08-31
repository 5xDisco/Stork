class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order('created_at')
  end

  def show
    @channels = Channel.all.order('created_at')
  end

  def create
    @channel = Channel.new(channel_params);
    if(@channel.save)
      redirect_to @channel
    else
      redirect_to html: '123'
    end
    
  end

  private
  def channel_params
    params.require(:channel).permit(:name, :description)
  end
end


