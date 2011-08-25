class Sender < ActiveRecord::Base
  belongs_to  :sendable, :polymorphic => true

end
