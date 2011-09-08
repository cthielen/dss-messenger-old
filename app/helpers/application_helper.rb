module ApplicationHelper
  def current_controller?(options)
      options[:controller] == controller_name
  end
  
  # Returns the full object (RESTful API call)
  def current_user
    Person.find(session[:cas_user])
  end
end
