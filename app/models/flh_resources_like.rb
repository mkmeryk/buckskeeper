class FlhResourcesLike < ApplicationRecord
  belongs_to :user
  belongs_to :flh_resources_post

  validates(:flh_resources_post_id, uniqueness:{scope: :user_id, message:"This post has been alredy been liked!"})
end
