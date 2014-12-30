class ChangeName < ActiveRecord::Migration
  def self.up
    rename_table :apikeys, :api_keys
  end

 def self.down
    rename_table :api_keys, :apikeys
 end
end
