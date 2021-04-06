class UsersController < ApplicationController

  # before_action :authorized, except: [:create]


    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find_by(id: params[:id])
      render json: @user
    end

    def create
      @user = current_user.create(users_params)
      render json: @user
    end 
   

    def update 
      @user.update(users_params)
      render json: @user
    end 

    def destroy
    
    end 
    
    def users_params
      params.require(:user).permit(:username, :password, :income, :budget, :year, :monthly)
   end
end
