class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :provision_key
      t.integer :user_cap
      t.boolean :has_app_access, default: true
      t.boolean :has_admin_access, default: true
      t.boolean :is_active, default: true
      
      t.timestamps
    end
  end
end
