class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
