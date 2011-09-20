DssMessenger::Application.routes.draw do
  resources :templates

  get "index", :controller => "Site"
  get "logout", :controller => "Site"
  get "search", :controller => "Site"
  get "access_denied", :controller => "Site"
  get "site/access_denied"

  root :to => "site#index"
  
  resources :messages

  namespace "api" do
    get "flashes", :controller => "custom"
  end
  
  mount Resque::Server, :at => "/resque"
end
