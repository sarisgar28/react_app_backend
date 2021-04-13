class ExpensesController < ApplicationController
    # before_action :find_user
    # before_action :authorized


    def index 
        # byebug
        @expenses = current_user.expenses
        render json: @expenses
    end 

    def show
        @expense = current_user.expense.find_by(id: params[:id])
        render json: @expense
    end 
    
    def create 
        expense = Expense.new(expenses_params)
        expense.user = current_user
        if expense.save
            render json: expense
        else
            render json: {error: "There was a problem saving expense", message: expense.errors.full_messages}
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

    # def find_user
    #     @user = User.find_by(id: params[:user_id])
    # end


    def expenses_params
       params.require(:expense).permit(:name, :amount)
    end


    
end
