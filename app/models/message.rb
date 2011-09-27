class Message < ActiveRecord::Base
  has_many :recipients
  belongs_to :sender
  belongs_to :message_type
  after_initialize :init

  accepts_nested_attributes_for :sender, :recipients

  def init
    self.flash  ||= false         # set the default value only if nil
    self.expires ||= Date.today >> 1 # next month
  end

  def to_tokens=(to_tokens)
    to_tokens.split(",").each do |uid|
      r = Recipient.new
      r.uid = uid
      self.recipients << r
    end
  end
  
  def recipient_emails
    recipient_uids = []
    
    # Resolve the recipient IDs
    rids = Recipient.where(:message_id => id)
    rids.each do |r|
      recipient_uids << r.uid
    end
    
    # Query RM to faltten the recipient IDs
    json_records = RmCustom.get("/resolve.json?ids=" + recipient_uids.join(',') + "&email")
    
    # Convert the JSON response into a regular Ruby array
    emails = []
    json_records.flatten.each do |record|
      emails << record["email"]
    end
    
    emails
  end
  
  def recipients_json
    recipient_uids = []
    
    # Resolve the recipient IDs
    rids = Recipient.where(:message_id => id)
    rids.each do |r|
      recipient_uids << r.uid
    end
    
    # Query RM to faltten the recipient IDs
    json_records = RmCustom.get("/resolve.json?ids=" + recipient_uids.join(','))
    
    # Convert the JSON response into a regular Ruby array
    names = []
    json_records.flatten.each do |record|
      names << {:name => record["name"], :id => record["id"]}
    end
    
    names.to_json
  end
end
