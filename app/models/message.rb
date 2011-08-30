class Message < ActiveRecord::Base
  has_many :recipients
  belongs_to :sender

  accepts_nested_attributes_for :sender, :recipients

  def to_tokens=(to_tokens)
    to_tokens.split(",").each do |id|
      self.recipients << Recipient.find_or_create_by_id(id)
    end
  end
end
