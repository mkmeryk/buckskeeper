class CreatePersonalExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :style
      t.string :title
      t.string :description
      t.string :source
      t.float :amount
      t.string :category
      t.string :type
      t.date :date
      t.integer :req_date
      t.date :due_date


      t.timestamps
    end
  end
end
