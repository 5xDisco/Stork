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
    end
    @errors = @channel.errors.full_messages
    # render remote:false ? create.html.erb : create.js.erb 
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
    cant_delete_channel = Channel.find_by(status:2)

    if(@channel.destroy)
      #導向不能刪的那一個
      redirect_to cant_delete_channel 
    else
      redirect_to @channel
    end
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to @channel
		end
    @errors = @channel.errors.full_messages
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def member
    @members = User.all; #這邊先撈假資料
  end

  def setting
    @channel = Channel.find(params[:id])
  end

  private
  #先準備好到時改
  def find_user_channel
    @channel = Channel.find(params[:id])
	end

  def channel_params
    params.require(:channel).permit(:name, :description, :status, :topic)
  end
end


