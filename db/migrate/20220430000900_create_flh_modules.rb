class CreateFlhModules < ActiveRecord::Migration[7.0]
  def change
    create_table :flh_modules do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
