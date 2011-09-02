class Person < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['uri']
  self.user = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['name']
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
  
  # ACL symbols
  def role_symbols
    # Get this app's API key
    api_key = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
    # Though we know this, let's keep it configurable in case it changes
    app_name = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['name']
    
    syms = []
    
    # Query for permissions of user via API key, converting them into declarative_authentication's needed symbols
    roles = Application.find(app_name, :params => { :person_id => loginid }).roles
    roles.each do |role|
      syms << role.name.underscore.to_sym
    end
    
    syms
  end
  
  #schema = { 'id' => :integer }
end
