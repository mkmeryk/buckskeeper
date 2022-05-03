class BusinessSavingsController < ApplicationController

    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_saving, only: [:edit, :update, :show, :destroy]
    before_action :authorize_business_account!
    
    def new
        @business_saving = BusinessSaving.new
    end

    def create

        @business_saving = BusinessSaving.new(business_saving_params)
        @business_saving.user = current_user
        if @business_saving.save
            redirect_to business_saving_path(@business_saving)
        else
            render :new
        end

    end

    def show
        # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@business_saving.user_id}"
    end

    def index
        @business_savings = current_user.business_savings
        #@business_savings = BusinessSaving.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @business_saving)
            render :edit
        else
            redirect_to root_path
        end
    end

    def update
        @business_saving.update(business_saving_params)
        redirect_to @business_saving
    end

    def destroy      
        if can?(:delete, @business_saving)
            @business_saving.destroy
            flash.alert = "Deleted the business_saving"
            redirect_to business_savings_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end       
    end   
    
    private

    def find_saving
        @business_saving = BusinessSaving.find params[:id]
    end

    def business_saving_params
        params.require(:business_saving).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end

end
