class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show edit update destroy ]

  def index
    @channels = Channel.all
  end
  
  def new
    @channel = Channel.new
  end
  
  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to channel_path(@channel.id)
    end     
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def show
    @channels = Channel.all
    render "index"
  end
  
  def destroy
  
  end

  private 

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
