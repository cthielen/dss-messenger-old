class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter CASClient::Frameworks::Rails::Filter

  # Returns the full object (RESTful API call)
  def current_user
    Person.find(session[:cas_user])
  end
end
