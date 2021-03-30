class ExpenseController < ApplicationController
    before_action :find_user
    before_action :authorized


    def index 
        @expenses = @user.expenses
        render json: @expenses
    end 

    def show
        @expense = @user.expense.find_by(id: params[:id])
        render json: @expense
    end 
    
    def create
    end 

    def update 
    end 
    
    def destroy
    end 
    
    
    
    
    private 

    def find_user
        @user = User.find_by(id: params[:user_id])
      end
end
