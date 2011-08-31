class RenameTypeToNameInMessageTypes < ActiveRecord::Migration
  def self.up
    rename_column :message_types, :type, :name
  end

  def self.down
    rename_column :message_types, :name, :type
  end
end
