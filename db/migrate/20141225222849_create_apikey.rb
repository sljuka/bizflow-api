class CreateApikey < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.references :user
      t.string :token
    end
  end
end
