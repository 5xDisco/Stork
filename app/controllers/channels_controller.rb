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
      redirect_to "/channels"
    end
  end

  def new
    @channel = Channel.new 
  end

  def leave
    @channel = Channel.find(params[:id])
    # render json: @leave
  end

  def destroy
    @channel = Channel.find(params[:id])
    if(@channel.destroy)
      redirect_to "/channels"
    else
      redirect_to @channel
    end
  end

  private
  def channel_params
    params.require(:channel).permit(:name, :description)
  end
end


