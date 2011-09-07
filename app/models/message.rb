class Message < ActiveRecord::Base
  has_many :recipients
  belongs_to :sender
  belongs_to :message_type

  accepts_nested_attributes_for :sender, :recipients

  def to_tokens=(to_tokens)
    to_tokens.split(",").each do |id|
      self.recipients << Recipient.find_or_create_by_id(id)
    end
  end
  
  def recipient_emails
    # Query RM to faltten the recipient IDs
    json_records = RmCustom.get("/resolve.json?ids=" + recipient_ids.join(',') + "&email")
    
    # Convert the JSON response into a regular Ruby array
    emails = []
    json_records.flatten.each do |record|
      emails << record["email"]
    end
    
    emails
  end
end
