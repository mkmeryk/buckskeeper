class AdminPanelController < ApplicationController
    before_action :authorize_admin_account!

    def panel 
        @users = User.all


    end

    def new_user
        @user = User.new
    end

    def create_user
        @new_user = User.new params.require(:user).permit(
            :first_name,:last_name,:email,:password,:password_confirmation, :is_advisor, :is_business, :is_individual, :phone_number
        )
        if @new_user.save
            flash.notice = "created a new advisor user account"

        else
            render :new, status: 303
        end
    end

end
