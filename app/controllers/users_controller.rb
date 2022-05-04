class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:edit, :update, :edit_password, :update_password, :show]
    before_action :find_user, only: [:edit, :update]
    before_action :authorize!, only: [:edit, :update]
    before_action :authorize_pass!, only: [ :edit_password, :update_password]

    def show
        @user = User.find params[:id]
        authorize!
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(
            :first_name,:last_name,:email,:password,:password_confirmation, :is_advisor, :is_business, :is_individual, :phone_number
        )
        if @user.save
            session[:user_id] = @user.id
            # your application has a session for each user in which you can store small amounts of data
            # the session is only avaliable in the controller and the view
            flash.notice = "Logged in!"
            redirect_to root_path
        else
            render :new, status: 303
        end
    end

    def edit
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@user.id}"

    end

    def update
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@user.id}"
        if @user.update user_params_update
            flash[notice] = 'Updated Successfully'
            redirect_to root_path
        else
            render :edit, status: 303
        end
    end

    def edit_password
        @user = User.find params[:user_id]
        authorize!
    end

    def update_password
        @user = User.find params[:user_id]
        if @user&.authenticate params[:user][:current_password]
            new_password = params[:user][:new_password]
            new_password_confirmation = params[:user][:new_password_confirmation]
            new_password_different = new_password != params[:user][:current_password]
            password_confirmed = new_password == new_password_confirmation

            if new_password_different && password_confirmed
                if  @user.update password: new_password, password_confirmation: new_password_confirmation
                    flash[:notice] = "Password changed successfully!"
                    redirect_to root_path, status: 303
                else
                    flash[:alert] = "Password update fail"
                    render :edit_password, status: 303
                end
            else
                flash[:alert] = "New password confirmation does not match."
                render :edit_password, status: 303
            end
        else
            flash[:alert] = "Your current password does not match our records"
            render :edit_password, status: 303
        end 

    end

    private

    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation, :is_advisor, :is_business, :is_individual, :phone_number)
    end

    def user_params_update
        params.require(:user).permit(:first_name,:last_name,:email, :phone_number)
    end

    def find_user
        @user = User.find params[:id]
    end

    def authorize_pass!
        user = User.find params[:user_id]
        unless current_user.id == user.id
            redirect_to root_path 
            flash[:alert] =  'Access Denied'
        end

    end

    def authorize!
        unless can? :crud, @user
        redirect_to root_path 
        flash[:alert] =  'Access Denied'
        end
    end

end
