class SiteController < ApplicationController
  def index
    @message = Message.new
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
