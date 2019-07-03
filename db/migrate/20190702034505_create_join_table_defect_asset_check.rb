class CreateJoinTableDefectAssetCheck < ActiveRecord::Migration[5.2]
  def change
    create_join_table :defects, :asset_checks do |t|
      # t.index [:defect_id, :asset_check_id]
      # t.index [:asset_check_id, :defect_id]
    end
  end
end
