class CreateFlhSocietyQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_society_questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body


      t.timestamps
    end
  end
end
