class ReclassTypeToStringInMessageTypes < ActiveRecord::Migration
  def self.up
    change_column :message_types, :type, :string
  end

  def self.down
    change_column :message_types, :type, :integer
  end
end
