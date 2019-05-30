class CreateTruckChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :truck_checks do |t|
      t.string :record_number
      t.float :odometer_reading
      t.boolean :has_defects, default: false
      t.boolean :is_cleared, default: false
      t.text :remarks
      t.references :report, foreign_key: true
      t.references :truck, foreign_key: true

      t.timestamps
    end
  end
end
