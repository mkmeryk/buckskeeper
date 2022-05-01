class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    
    has_many :personal_expenses, dependent: :destroy
    has_many :personal_savings, dependent: :destroy
    has_many :personal_income, dependent: :destroy
    has_many :business_expenses, dependent: :destroy
    has_many :business_savings, dependent: :destroy
    has_many :business_income, dependent: :destroy
    has_many :flh_modules, dependent: :destroy
    has_many :flh_events, dependent: :destroy
    has_many :flh_society_questions, dependent: :destroy
    has_many :flh_society_answers, dependent: :destroy
    has_many :flh_society_likes, dependent: :destroy
    has_many :liked_flh_society_questions, through: :flh_society_likes, source: :flh_society_question
    has_many :flh_resources_posts, dependent: :destroy
    has_many :flh_resources_likes, dependent: :destroy
    has_many :liked_flh_resources_posts, through: :flh_resources_posts, source: :flh_resources_post

    def full_name
        self.first_name + " " + self.last_name
    end

end
