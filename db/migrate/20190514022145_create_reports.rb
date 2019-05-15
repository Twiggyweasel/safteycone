class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :record_id
      t.boolean :is_complete
      t.datetime :completion_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
