class CreateDefects < ActiveRecord::Migration[5.2]
  def change
    create_table :defects do |t|
      t.string :name
      t.boolean :is_truck_defect, default: false
      t.boolean :is_trailer_defect, default: false
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
