class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content, null: false
      t.datetime :expired_at, null: false
      t.boolean :status, null: false, default: "false"
      t.boolean :roulette, null: false, default: "false"
      t.string :task_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
