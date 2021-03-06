class SpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_space


  def list
    @spaces = current_user.spaces.order(id: :desc)
  end

  def create
    @space = current_user.spaces.new(space_params)

    if current_user.save
        redirect_to stork_step2_path
    else
        redirect_to stork_step1_path
    end
  end

  def update
    if @space.update(space_params)
      flash[:notice] = "編輯成功"
      redirect_to root_path 
    else
      flash[:notice] = "編輯失敗"
      render :edit
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :avatar, uploads: [])
  end

  def find_space
    @space = Space.find_by(id: params[:id])
  end
end
