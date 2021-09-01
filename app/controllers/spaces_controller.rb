class SpacesController < ApplicationController


    def list
        @spaces = Space.all
    end


    def new
        @space = Space.new
    end


    def create        
        @space = Space.new(clean_params)
        
        if @space.save
            redirect_to "/list" 
        else
            flash[:notice] = "新增失敗"
            render :new
        end
    end


    def show
        @space = Space.find_by(id: params[:id])
    end

private
    def clean_params
        params.require(:space).permit(:name, :icon, :created_by) #require的hash是從 create 來的？
    end

end
