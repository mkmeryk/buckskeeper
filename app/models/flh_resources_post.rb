class FlhResourcesPost < ApplicationRecord
  belongs_to :user

  has_many :flh_resources_likes, dependent: :destroy
  has_many :flh_resources_likers, through: :flh_resources_likes, source: :user
end
