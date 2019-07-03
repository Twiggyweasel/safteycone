class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :type
      t.string :asset_number
      t.date :last_service_date
      t.float :last_odo_reading
      t.datetime :last_odo_read_date
      t.boolean :is_active, default: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
