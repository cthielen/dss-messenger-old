class RmCustom
  include HTTParty
  
  base_uri YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['keys']['uri']
  basic_auth "DSS Messenger", YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['keys']['key']
end
