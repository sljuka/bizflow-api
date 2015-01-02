class CreateProcessComments < ActiveRecord::Migration
  def change
    create_table :process_comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :bf_process_id

      t.timestamps
    end
  end
end
