class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    redirect_to space_channel_path(@message.channel.space.id, @message.channel_id)
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def show
  
  end
  
  def destroy
  
  end

  private 

  def message_params
    params.require(:message).permit(:content, :channel_id, :user_id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
