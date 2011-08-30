class Message < ActiveRecord::Base
  has_one :sender

  # Override these for easier form usage
  def loginid=(loginid)
  end

  def to_tokens=(to_tokens)
    #self.to_tokens = to_tokens.split(",")
  end
end
