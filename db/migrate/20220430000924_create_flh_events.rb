class CreateFlhEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.text :link
      t.date :date

      t.timestamps
    end
  end
end
