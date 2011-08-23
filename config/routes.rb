DssMessenger::Application.routes.draw do
  get "site/index"
  get "site/logout"

  root :to => "site#index"
end
