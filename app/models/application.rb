class Application < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['keys']['uri']
  self.user = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['keys']['name']
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['keys']['key']
end
