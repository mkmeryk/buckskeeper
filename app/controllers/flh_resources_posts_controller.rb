class FlhResourcesPostsController < ApplicationController
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_flh_resources_post, only: [:edit, :update, :show, :destroy]

    def new
        @flh_resources_post = FlhResourcesPost.new
    end

    def create

        @flh_resources_post = FlhResourcesPost.new(flh_resources_post_params)
        @flh_resources_post.user = current_user
        if @flh_resources_post.save
            redirect_to flh_resources_post_path(@flh_resources_post)
        else
            render :new
        end

    end

    def show
        @like = @flh_resources_post.flh_resources_likes.find_by(user: current_user)
    end

    def index
        @flh_resources_posts = FlhResourcesPost.all.order(created_at: :desc)
    end

    def edit
        if can?(:edit, @flh_resources_post)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @flh_resources_post.update(flh_resources_post_params)
        redirect_to @flh_resources_post
    end

    def destroy
        if can?(:delete, @flh_resources_post)
            @flh_resources_post.destroy
            flash.alert = "Deleted the flh_resources_post"
            redirect_to flh_resources_posts_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_flh_resources_post
        @flh_resources_post = FlhResourcesPost.find params[:id]
    end

    def flh_resources_post_params
        params.require(:flh_resources_post).permit( :title,  :body)
    end
end
