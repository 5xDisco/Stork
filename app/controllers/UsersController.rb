class UsersController < ApplicationController
  
    def create
      @user = User.new(user_params)
      if @user.save
        ContactMailer.say_hello_to(@user).deliver_now
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
   
  end