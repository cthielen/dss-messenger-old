class AddDefaultMessageTypes < ActiveRecord::Migration
  def self.up
    types = ['Inbox', 'E-Mail and Inbox', 'E-Mail', 'Flash Announcement']
    for type in types
      mt = MessageType.new
      mt.type = type
      mt.save
    end
  end

  def self.down
    MessageType.delete_all
  end
end
