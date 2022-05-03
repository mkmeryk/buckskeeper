class PersonalSavingsController < ApplicationController

    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_saving, only: [:edit, :update, :show, :destroy]
    before_action :authorize_individual_account!

    def new
        @personal_saving = PersonalSaving.new
    end

    def create

        @personal_saving = PersonalSaving.new(personal_saving_params)
        @personal_saving.user = current_user
        if @personal_saving.save
            redirect_to personal_saving_path(@personal_saving)
        else
            render :new
        end

    end

    def show
        # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@personal_saving.user_id}"
    end

    def index
        @personal_savings = current_user.personal_savings
        # @personal_savings = PersonalSaving.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @personal_saving)
            render :edit
        else
            redirect_to root_path
        end
    end

    def update
        @personal_saving.update(personal_saving_params)
        redirect_to @personal_saving
    end

    def destroy      
        if can?(:delete, @personal_saving)
            @personal_saving.destroy
            flash.alert = "Deleted the personal_saving"
            redirect_to personal_savings_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end       
    end   
    
    private

    def find_saving
        @personal_saving = PersonalSaving.find params[:id]
    end

    def personal_saving_params
        params.require(:personal_saving).permit(:style, :title, :description, :source, :amount, :category, :date, :req_date)
    end

end
