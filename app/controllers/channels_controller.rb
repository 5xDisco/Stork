class ChannelsController < ApplicationController
  before_action :find_user_channel, only: [:leave, :update, :destroy, :edit, :setting]

  def index
<<<<<<< HEAD
    @channels = Channel.all.order('created_at')
=======
    #@channels = Channel.all.order('created_at')
    
    @channels = current_user.channels.order('created_at')
    
    #render layout: "channel"
>>>>>>> 087ed5e... 增加與 user 關聯性
  end

  def show
    #@channels = Channel.all.order('created_at')

    @channels = current_user.channels.order('created_at')
  end

  def create
    @channel = current_user.channels.new(channel_params);

    if(current_user.save)
      redirect_to @channel
    end
    @errors = @channel.errors.full_messages 
  end

  def new
    @channel = current_user.channels.new 
  end

  def leave
    
  end


  def destroy
   
    lobby_channel = Channel.find_by(status:2)

    if(@channel.destroy)
      #導向不能刪的那一個
      redirect_to "/channels" 
    else
      redirect_to @channel
    end
  end

  def update

    if @channel.update(channel_params)
      redirect_to @channel
    end
    @errors = @channel.errors.full_messages
  end

  def edit

  end

  def member
    @members = User.all; #這邊先撈假資料
  end

  def setting

  end

  private
  #先準備好到時改
  def find_user_channel
    
    @channel = current_user.channels.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :status, :topic)
  end
end


