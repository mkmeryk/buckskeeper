class CreatePersonalSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_savings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :style
      t.string :title
      t.string :description
      t.string :source
      t.float :amount
      t.string :category
      t.date :date
      t.integer :req_date
  

      t.timestamps
    end
  end
end
