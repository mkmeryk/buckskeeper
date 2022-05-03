class FlhModulesController < ApplicationController
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_module, only: [:edit, :update, :show, :destroy]
    before_action :authorize_advisor_account!, only:[:new, :create, :destroy, :edit, :update]

    def new
        @flh_module = FlhModule.new
    end

    def create

        @flh_module = FlhModule.new(flh_module_params)
        @flh_module.user = current_user
        if @flh_module.save
            redirect_to flh_module_path(@flh_module)
        else
            render :new
        end

    end

    def show
    end

    def index
        @flh_modules = FlhModule.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @flh_module)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @flh_module.update(flh_module_params)
        redirect_to @flh_module
    end

    def destroy
        if can?(:delete, @flh_module)
            @flh_module.destroy
            flash.alert = "Deleted the flh_module"
            redirect_to flh_modules_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_module
        @flh_module = FlhModule.find params[:id]
    end

    def flh_module_params
        params.require(:flh_module).permit(:title, :description, :body)
    end
end
