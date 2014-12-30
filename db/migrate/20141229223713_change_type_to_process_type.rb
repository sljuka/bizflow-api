class ChangeTypeToProcessType < ActiveRecord::Migration
  def change

    rename_column :bf_processes, :type, :process_type

  end
end
