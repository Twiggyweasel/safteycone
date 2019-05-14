class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_active, default: true
      t.references :company, foreign_key: true
      t.integer :account_type

      t.timestamps
    end
  end
end
