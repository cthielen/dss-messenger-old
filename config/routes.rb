DssMessenger::Application.routes.draw do
  get "index", :controller => "Site"
  get "logout", :controller => "Site"
  get "search", :controller => "Site"

  root :to => "site#index"
  
  resources :messages
end
