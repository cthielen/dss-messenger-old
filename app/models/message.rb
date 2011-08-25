class Message < ActiveRecord::Base
  has_one :sender, :as => :sendable
end
