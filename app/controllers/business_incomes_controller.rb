class BusinessIncomesController < ApplicationController

    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_income, only: [:edit, :update, :show, :destroy]
    before_action :authorize_business_account!
    
    def new
        @business_income = BusinessIncome.new
    end

    def create

        @business_income = BusinessIncome.new(business_income_params)
        @business_income.user = current_user
        if @business_income.save
            redirect_to business_income_path(@business_income)
        else
            render :new
        end

    end

    def show
    end

    def index
        @business_incomes = BusinessIncome.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @business_income)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @business_income.update(business_income_params)
        redirect_to @business_income
    end

    def destroy
        if can?(:delete, @business_income)
            @business_income.destroy
            flash.alert = "Deleted the business_income"
            redirect_to business_income_index_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_income
        @business_income = BusinessIncome.find params[:id]
    end

    def business_income_params
        params.require(:business_income).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end

end
