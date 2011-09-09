class MessageSender
  @queue = :messages_queue
  
  def self.perform(message_id)
    # Do the work here
    message = Message.find(message_id)
    MessageMailer.regular_message(message).deliver
  end
end
