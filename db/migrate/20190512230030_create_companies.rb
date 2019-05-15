class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :provision_key
      t.integer :user_cap
      
      t.timestamps
    end
  end
end
