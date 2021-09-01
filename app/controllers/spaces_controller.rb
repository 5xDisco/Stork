class SpacesController < ApplicationController

    def list
        @spaces = Space.all.order(id: :desc)
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

    def edit
        @space = Space.find_by(id: params[:id])
    end

    def update
        @space = Space.find_by(id: params[:id])
        
        if @space.update(clean_params)
            flash[:notice] = "編輯成功"
            redirect_to "/list" 
        else
            flash[:notice] = "編輯失敗"
            render :edit
        end
    end

    def destroy
        @space = Space.find_by(id: params[:id])
        @space.destroy
        flash[:notice] = "刪除了"
        redirect_to "/list" 
    end


private
    def clean_params
        params.require(:space).permit(:name, :icon, :created_by) #require的hash是從 create 來的？
    end

end
