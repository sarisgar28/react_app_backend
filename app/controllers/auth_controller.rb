class AuthController < ApplicationController
    before_action :authorized, only: [:signup]

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {jwt: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {jwt: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
  
    def signup
      render json: @user
    end


      
   private 

   def user_params
       params.require(:user).permit(:username, :password)
    end
end
