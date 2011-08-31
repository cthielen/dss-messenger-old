class AddMessageTypeIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :message_type_id, :integer
  end

  def self.down
    remove_column :messages, :message_type_id
  end
end
