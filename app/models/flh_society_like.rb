class FlhSocietyLike < ApplicationRecord
  belongs_to :user
  belongs_to :flh_society_question

  validates(:flh_society_question_id, uniqueness:{scope: :user_id, message: "This question has alredy been liked!"})

end
