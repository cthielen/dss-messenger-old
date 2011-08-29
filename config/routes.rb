DssMessenger::Application.routes.draw do
  get "site/index"
  get "site/logout"
  get "site/search"

  root :to => "site#index"
  
  resources :messages
end
