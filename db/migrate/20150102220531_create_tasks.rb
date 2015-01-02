class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_type
      t.integer :user_id
      t.integer :bf_process_id
      t.datetime :finished_at
      t.timestamps
    end
  end
end
