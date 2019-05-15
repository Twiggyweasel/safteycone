class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :email
      t.integer :notification_pref
      t.integer :account_type
      t.boolean :is_active, default: true
      
      t.references :company, foreign_key: true
      

      t.timestamps
    end
  end
end
