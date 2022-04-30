class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index:{unique: true}
      t.string :phone_number
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.boolean :is_advisor, default: false
      t.boolean :is_business, default: false
      t.boolean :is_individual, default: false


      t.timestamps
    end
  end
end
