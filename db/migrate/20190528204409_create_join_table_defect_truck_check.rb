class CreateJoinTableDefectTruckCheck < ActiveRecord::Migration[5.2]
  def change
    create_join_table :defects, :truck_checks do |t|
      # t.index [:defect_id, :truck_check_id]
      # t.index [:truck_check_id, :defect_id]
    end
  end
end
