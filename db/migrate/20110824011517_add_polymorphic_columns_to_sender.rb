class AddPolymorphicColumnsToSender < ActiveRecord::Migration
  def self.up
    add_column :senders, :sendable_id, :integer
    add_column :senders, :sendable_type, :string
  end

  def self.down
    remove_column :senders, :sendable_id
    remove_column :senders, :sendable_type
  end
end
