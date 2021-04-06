class ExpensesController < ApplicationController
    before_action :find_user
    # before_action :authorized


    def index 
        # byebug
        @expenses = @user.expenses
        render json: @expenses
    end 

    def show
        @expense = @user.expense.find_by(id: params[:id])
        render json: @expense
    end 
    
    def create 
        @user = User.find_or_create_by(user_params)
        @expense = user.expenses.build(expenses_params)
       if @user.valid? && @expense.save
            render json:  @expense
        else 
            render json: {error: "Ooops! It didn't work, try again!"}
        end
    end 

    def update 
        @expense.update(expenses_params)
        render json: @expense
    end 
    


    def destroy
        @expense = Expense.find_by_id(params[:id])
        @expense.destroy
        render json: @expense
    end
    
    
    
    
    private 

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    private 

   def expenses_params
       params.require(:expense).permit(:name, :amount, :user_id)
    end


   def user_params
    params.require(:user).permit(:username, :password)
 end
    
end
