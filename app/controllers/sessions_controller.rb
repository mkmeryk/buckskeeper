class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by_email params[:email]
        puts @user.email
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>i'm here at sessions create"
        if @user && @user.authenticate(params[:password])
            puts ">>>>>>>>>>>>>>>>>>I am loged in now as #{@user.full_name}"
            session[:user_id] = @user.id
            redirect_to root_path, {notice: "Logged in"}
        else
            render :new, { alert: "Wrong email or password!", status: 303 }
        end
    end
    


    def destroy
        # session.delete :user_id
        puts "hello world"
        session[:user_id] = nil
        flash.notice = "Logged out"
        redirect_to root_path
        # p "hello"
        
    end

end
