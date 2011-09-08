class MessageSender
  @queue = :messages_queue
  
  def self.perform(message_id)
    # Do the work here
    message = Message.find(message_id)
    
  end
end
