class CreateFlhSocietyLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_society_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flh_society_question, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
