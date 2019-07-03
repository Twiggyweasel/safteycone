class CreateAssetChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_checks do |t|
      t.string :record_number
      t.float :odometer_reading
      t.text :remarks
      t.boolean :has_defects, default: false
      t.boolean :cleared, default: false
      t.references :checkable, polymorphic: true, index: true
      t.references :report, index: true
      t.references :asset, index: true
      t.timestamps
    end
  end
end
