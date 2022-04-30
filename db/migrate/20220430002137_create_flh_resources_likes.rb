class CreateFlhResourcesLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_resources_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flh_resources_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
