class Person < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['uri']
  self.user = "DSS Messenger"
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
  
  # ACL symbols
  def role_symbols
    # Get this app's API key
    api_key = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
    
    syms = []
    
    # Query for permissions of user via API key, converting them into declarative_authentication's needed symbols
    roles.includes("application").where(:applications => {:api_key => api_key}).each do |role|
      syms << role.name.underscore.to_sym
    end
    
    syms
  end
end
