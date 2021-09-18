class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :find_space, only: [:show, :edit, :destory]

  def home
    if user_signed_in?
      @spaces = current_user.spaces
      spaces = []
      @spaces.each do |s|
        spaces << s.channels.lobby_channels
      end
      @channels = spaces.flatten

    end
  end

  def step1
    @space = current_user.spaces.new
  end

  def step2
    @space = current_user.spaces.last
    @channel = current_user.channels.new(space_id: @space.id, is_public: 'private_channel')
    lobby_channel = current_user.channels.create(name: "公開區", is_public: 'lobby_channel', space_id: @space.id);
  end

  def step3
    @space = Space.last
    @channel = current_user.channels.create(channel_params);
    @channelName = Channel.last[:name]
  end


  def show
  end


  def invite
    # 為實作此
    # @invite = ContactMailer.invite(email_field).deliver_now
    # redirect_to channel_path(@channel.id), notice: '成功邀請'
  end

  def edit
    @space = find_space
  end

  def destroy
    @space = find_space
    @space.destroy
    flash[:notice] = "刪除了"
    redirect_to root_path 
  end

  private
  def space_params
    params.require(:space).permit(:name, :icon, :user_id)
  end

  def find_space
    @space = Space.find_by(id: params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name, :space_id, :is_public);
  end
end
