class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :vehicle_number
      t.date :last_service_date
      t.float :last_odometer_reading
      t.datetime :last_odometer_date
      t.boolean :is_active, default: false
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
