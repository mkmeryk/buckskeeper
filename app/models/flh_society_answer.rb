class FlhSocietyAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :flh_society_question
  validates :body, presence: true
end
