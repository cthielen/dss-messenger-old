class DropPolymorphismFromSender < ActiveRecord::Migration
  def self.up
    remove_column :senders, :sendable_id
    remove_column :senders, :sendable_type
  end

  def self.down
    add_column :senders, :sendable_id, :integer
    add_column :senders, :sendable_type, :string
  end
end
