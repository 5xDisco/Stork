class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def index
    end

    def step2
        @space = Space.last[:name]
        @spaces = current_user
    end

    def show
        space_find_id
    end

    def list
        @spaces = Space.where(created_by: current_user.id).order(id: :desc)
        # @spaces = current_user.spaces.order(id: :desc)
    end


    private
    def space_params
        if params[:space][:created_by].empty?
            params[:space][:created_by] = current_user.id
        params.require(:space).permit(:name, :icon, :created_by)
        end
    end

    def space_find_id
        # byebug
        @space = Space.find_by(id: params[:id])
    end
end



