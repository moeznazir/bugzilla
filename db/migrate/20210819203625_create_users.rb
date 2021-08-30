class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false   
      t.string :email, null: false
      t.string :password_digest
      t.string :user_role, null: false

      t.timestamps
    end
  end
end
