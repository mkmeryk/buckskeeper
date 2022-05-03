class BusinessController < ApplicationController
    before_action :authorize_business_account!
    
    def show
        @business_expenses = current_user.business_expenses
        @business_income = current_user.business_income
        @business_savings = current_user.business_savings
        @monthly_income = BusinessIncome.where(user: current_user).where(date: (Date.today - 30)..Date.today)
        @yearly_income = BusinessIncome.where(user: current_user).where(date: (Date.today - 365)..Date.today)
        @monthly_expenses = BusinessExpense.where(user: current_user).where(date: (Date.today - 30)..Date.today)
        @yearly_expenses = BusinessExpense.where(user: current_user).where(date: (Date.today - 365)..Date.today)
        @monthly_savings = BusinessSaving.where(user: current_user).where(date: (Date.today - 30)..Date.today)
        @yearly_savings = BusinessSaving.where(user: current_user).where(date: (Date.today - 365)..Date.today)
    
        @monthly_income_total = 0
        monthly_income_total = @monthly_income.each do |income|
            @monthly_income_total = income.amount + @monthly_income_total 
        end

        @yearly_income_total = 0
        yearly_income_total = @yearly_income.each do |income|
            @yearly_income_total = income.amount + @yearly_income_total 
        end

        @monthly_expenses_total = 0
        monthly_expenses_total = @monthly_expenses.each do |expenses|
            @monthly_expenses_total = expenses.amount + @monthly_expenses_total 
        end

        @yearly_expenses_total = 0
        yearly_expenses_total = @yearly_expenses.each do |expenses|
            @yearly_expenses_total = expenses.amount + @yearly_expenses_total 
        end

        @monthly_savings_total = 0
        monthly_savings_total = @monthly_savings.each do |savings|
            @monthly_savings_total = savings.amount + @monthly_savings_total 
        end

        @yearly_savings_total = 0
        yearly_savings_total = @yearly_savings.each do |savings|
            @yearly_savings_total = savings.amount + @yearly_savings_total 
        end

        def cashflow(net_income,assets,liabilities)
            cashflow = 0.00
            cashflow = net_income - liabilities
            return cashflow
        end

        @cashflow = cashflow(@yearly_income_total,@yearly_savings_total,@yearly_expenses_total)

       
    end
end
