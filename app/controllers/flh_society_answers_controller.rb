class FlhSocietyAnswersController < ApplicationController


    before_action :authenticate_user!
  
    

    def create
        @flh_society_question = FlhSocietyQuestion.find params[:question_id]
        @flh_society_answer = FlhSocietyAnswer.new(params.require(:flh_society_answer).permit(:body))
        
        puts ">>>>>>>>>>>>>>>>>>>>>>>>.#{@flh_society_question}"
        @flh_society_answer.flh_society_question = @flh_society_question
        @flh_society_answer.user = current_user
        if @flh_society_answer.save
            redirect_to flh_society_question_path(@flh_society_question.id), status: 303
        else
            @flh_society_answers = @flh_society_question.flh_society_answers
            render '/flh_society_questions/show', status: 303
        end
        
    end
    
    def destroy
        @flh_society_answer = FlhSocietyAnswer.find params[:id]
        if can?(:crud, @flh_society_answer)
            @flh_society_answer.destroy
            redirect_to flh_society_question_path(@flh_society_answer.flh_society_question)
        else
            redirect_to root_path, alert: "Not Authorized"
        end
    end




    
    

end
