class RmCustom
  include HTTParty
  
  base_uri YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['uri']
  basic_auth "DSS Messenger", YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
  
  
end
