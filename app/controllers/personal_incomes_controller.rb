class PersonalIncomesController < ApplicationController
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_income, only: [:edit, :update, :show, :destroy]

    def new
        @personal_income = PersonalIncome.new
    end

    def create

        @personal_income = PersonalIncome.new(personal_income_params)
        @personal_income.user = current_user
        if @personal_income.save
            redirect_to personal_income_path(@personal_income)
        else
            render :new
        end

    end

    def show
    end

    def index
        @personal_incomes = PersonalIncome.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @personal_income)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @personal_income.update(personal_income_params)
        redirect_to @personal_income
    end

    def destroy
        if can?(:delete, @personal_income)
            @personal_income.destroy
            flash.alert = "Deleted the personal_income"
            redirect_to personal_income_index_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_income
        @personal_income = PersonalIncome.find params[:id]
    end

    def personal_income_params
        params.require(:personal_income).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end

end
