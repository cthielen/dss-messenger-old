class DropFlashMessageDataFromMessageTypes < ActiveRecord::Migration
  def up
    m = MessageType.find_by_name("Flash Announcement")
    unless m.nil?
      m.delete
    end
  end

  def down
    MessageType.create(:name => "Flash Announcement")
  end
end
