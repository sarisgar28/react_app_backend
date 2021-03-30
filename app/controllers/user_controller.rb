class UserController < ApplicationController


    def index 
      @users = User.all 
      render json: @users
    end 

    def show
        @user = User.find_by(id: params[:id]) 
        render json: @user 
    end 
    
    def create 
    end
end
