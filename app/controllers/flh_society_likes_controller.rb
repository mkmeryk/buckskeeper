class FlhSocietyLikesController < ApplicationController

    def create
        flh_society_question = FlhSocietyQuestion.find params[:question_id]
        like = FlhSocietyLike.create(flh_society_question: flh_society_question, user: current_user)
        if can?(:like, flh_society_question)
            if like.save
                flash.notice = "flh_society_question liked!"
                puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Likeeeeeeeeeeeeeeeeeeeeeed"
            else
                flash.alert = like.errors.full_messages.join(', ')
            end
        else
            flash.alert = "You can not like this flh_society_question"
        end
        redirect_to flh_society_question_path(flh_society_question)
    end

    def destroy
        like = current_user.flh_society_likes.find params[:id]
        if can?(:destroy, like)
            like.destroy
            flash.notice = "Question Unliked!"
        else
            flash.alert = "Can't unlike it!"
        end
        redirect_to flh_society_question_path(like.flh_society_question)
    end

end
