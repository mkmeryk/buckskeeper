class FlhSocietyQuestion < ApplicationRecord
  belongs_to :user
  
  has_many :flh_society_answers, dependent: :destroy
  has_many :flh_society_likes, dependent: :destroy
  has_many :flh_society_likers, through: :flh_society_likes, source: :user
end
