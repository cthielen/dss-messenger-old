class Application < ActiveRecord::Base
  def to_param
    name
  end
end
