class Message < ActiveRecord::Base
  has_one :sender
end
