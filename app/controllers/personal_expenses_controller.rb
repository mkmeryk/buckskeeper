class PersonalExpensesController < ApplicationController
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_expense, only: [:edit, :update, :show, :destroy]
    before_action :authorize_individual_account!

    def new
        @personal_expense = PersonalExpense.new
    end

    def create

        @personal_expense = PersonalExpense.new(personal_expense_params)
        @personal_expense.user = current_user
        if @personal_expense.save
            redirect_to personal_expense_path(@personal_expense)
        else
            render :new
        end

    end

    def show
    end

    def index
        @personal_expenses = current_user.personal_expenses
        #@personal_expenses = PersonalExpense.all.order(created_at: :desc)    

        

    end

    def edit
        if can?(:edit, @personal_expense)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @personal_expense.update(personal_expense_params)
        redirect_to @personal_expense
    end

    def destroy
        if can?(:delete, @personal_expense)
            @personal_expense.destroy
            flash.alert = "Deleted the personal_expense"
            redirect_to personal_expenses_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_expense
        @personal_expense = PersonalExpense.find params[:id]
    end

    def personal_expense_params
        params.require(:personal_expense).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end
end
