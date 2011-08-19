module ApplicationHelper
  def current_controller?(options)
      options[:controller] == @controller.controller_name
  end
end
