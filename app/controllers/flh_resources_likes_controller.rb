class FlhResourcesLikesController < ApplicationController
    #for routing purpuses, recources likes is called resources saves
    def create
        flh_resources_post = FlhResourcesPost.find params[:post_id]
        like = FlhResourcesLike.create(flh_resources_post: flh_resources_post, user: current_user)
        if can?(:like, flh_resources_post)
            if like.save
                flash.notice = "flh_resources_post liked!"
                puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Likeeeeeeeeeeeeeeeeeeeeeed"
            else
                flash.alert = like.errors.full_messages.join(', ')
            end
        else
            flash.alert = "You can not like this flh_resources_post"
        end
        redirect_to flh_resources_post_path(flh_resources_post)
    end

    def destroy
        like = current_user.flh_resources_likes.find params[:id]
        if can?(:destroy, like)
            like.destroy
            flash.notice = "Post Unliked!"
        else
            flash.alert = "Can't unlike it!"
        end
        redirect_to flh_resources_post_path(like.flh_resources_post)
    end

end
