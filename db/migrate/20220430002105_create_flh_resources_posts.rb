class CreateFlhResourcesPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_resources_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
