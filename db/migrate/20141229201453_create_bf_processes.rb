class CreateBfProcesses < ActiveRecord::Migration
  def change
    create_table :bf_processes do |t|
      t.string :type
      t.integer :user_id
      t.string :pid
      t.timestamps
    end
  end
end
