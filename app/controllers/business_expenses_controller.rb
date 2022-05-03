class BusinessExpensesController < ApplicationController

    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_expense, only: [:edit, :update, :show, :destroy]
    before_action :authorize_business_account!

    def new
        @business_expense = BusinessExpense.new
    end

    def create

        @business_expense = BusinessExpense.new(business_expense_params)
        @business_expense.user = current_user
        if @business_expense.save
            redirect_to business_expense_path(@business_expense)
        else
            render :new
        end

    end

    def show
    end

    def index
        @business_expenses = current_user.business_expenses
        #@business_expenses = BusinessExpense.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @business_expense)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @business_expense.update(business_expense_params)
        redirect_to @business_expense
    end

    def destroy
        if can?(:delete, @business_expense)
            @business_expense.destroy
            flash.alert = "Deleted the business_expense"
            redirect_to business_expenses_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_expense
        @business_expense = BusinessExpense.find params[:id]
    end

    def business_expense_params
        params.require(:business_expense).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end

end
