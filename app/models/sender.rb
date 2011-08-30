class Sender < ActiveRecord::Base
  has_many :messages
  
  def name
    # Type to query depends on ID leading digit (see README/Technical Notes in DSS-RM)
    case id.to_s.first.to_i
    when 1
      p = Person.find(id)
      p.first + ' ' + p.last
    end
  end
end
