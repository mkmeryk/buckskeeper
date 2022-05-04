class ApplicationController < ActionController::Base
    def authenticate_user!
        if !user_signed_in?
            flash.notice = "Please sign in first!"
            redirect_to new_session_path
        end
    end

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def current_user
        @current_user ||= User.find_by_id session[:user_id]
    end
    helper_method :current_user

    def authorize_individual_account!
        unless authenticate_user!
            unless current_user.is_individual == true
                redirect_to root_path
                flash[:alert] = 'Access Denied'
            end  
        end
    end
    helper_method :authorize_individual_account!

    def authorize_business_account!
        unless authenticate_user!
            unless current_user.is_business == true
                redirect_to root_path
                flash[:alert] = 'Access Denied'
            end
        end
    end
    helper_method :authorize_business_account!

    def authorize_advisor_account!
        unless authenticate_user!
            unless current_user.is_advisor == true
                redirect_to root_path
                flash[:alert] = 'Access Denied'
            end
        end
    end
    helper_method :authorize_advisor_account!
end
