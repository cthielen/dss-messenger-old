class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.integer :id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
