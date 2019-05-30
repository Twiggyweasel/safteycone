class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :record_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.datetime :completion_date
      t.boolean :cleared_for_use
      t.boolean :is_complete      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
