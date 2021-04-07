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
      @user = User.create(users_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, jwt: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
   

    def update 
      @user = User.find_by(id: params[:id])
       @user.update(users_params)
      render json: @user
    end 

    def destroy
    
    end 
    private 

  

    def users_params
    
      params.require(:user).permit(:username, :password, :income, :budget, :year, :monthly)
   end
end
