class FlhEventsController < ApplicationController
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_module, only: [:edit, :update, :show, :destroy]

    def new
        @flh_event = FlhEvent.new
    end

    def create

        @flh_event = FlhEvent.new(flh_event_params)
        @flh_event.user = current_user
        if @flh_event.save
            redirect_to flh_event_path(@flh_event)
        else
            render :new
        end

    end

    def show
    end

    def index
        @flh_events = FlhEvent.all.order(created_at: :desc)

    end

    def edit
        if can?(:edit, @flh_event)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @flh_event.update(flh_event_params)
        redirect_to @flh_event
    end

    def destroy
        if can?(:delete, @flh_event)
            @flh_event.destroy
            flash.alert = "Deleted the flh_event"
            redirect_to flh_events_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_module
        @flh_event = FlhEvent.find params[:id]
    end

    def flh_event_params
        params.require(:flh_event).permit(:title, :body, :link, :date)
    end
end
