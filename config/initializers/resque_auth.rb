Resque::Server.use(Rack::Auth::Basic) do |user, password|
  name = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['resque']['name']
  pw = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['resque']['password']
  
  (user == name) && (password == pw)
end
