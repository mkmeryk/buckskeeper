class FlhSocietyQuestionsController < ApplicationController
    
    before_action :authenticate_user!, only:[ :new, :create, :destroy, :edit, :update ]
    before_action :find_flh_society_question, only: [:edit, :update, :show, :destroy]

    def new
        @flh_society_question = FlhSocietyQuestion.new
    end

    def create

        @flh_society_question = FlhSocietyQuestion.new(flh_society_question_params)
        @flh_society_question.user = current_user
        if @flh_society_question.save
            redirect_to flh_society_question_path(@flh_society_question)
        else
            render :new
        end

    end

    def show
        @flh_society_answer = FlhSocietyAnswer.new
        @flh_society_answers = @flh_society_question.flh_society_answers
        @like = @flh_society_question.flh_society_likes.find_by(user: current_user)
    end

    def index
        @flh_society_questions = FlhSocietyQuestion.all.order(created_at: :desc)
    end

    def edit
        if can?(:edit, @flh_society_question)
            render :edit
        else
            redirect_to root_path
        end

    end

    def update
        @flh_society_question.update(flh_society_question_params)
        redirect_to @flh_society_question
    end

    def destroy
        if can?(:delete, @flh_society_question)
            @flh_society_question.destroy
            flash.alert = "Deleted the flh_society_question"
            redirect_to flh_society_questions_path           
        else
            flash.notice = "Access denied"
            redirect_to new_session_path
        end

    end   
    
    private

    def find_flh_society_question
        @flh_society_question = FlhSocietyQuestion.find params[:id]
    end

    def flh_society_question_params
        params.require(:flh_society_question).permit( :title,  :body)
    end
    
    
end
