class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.string :delivery_status
      t.datetime :sent
      t.datetime :expires
      t.boolean :flash
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
