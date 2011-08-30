class SiteController < ApplicationController
  def index
    @message = Message.new
    
    @message.sender = Sender.find_or_create_by_id(current_user.id)
  end
  
  def search
    unless params[:q].nil?
      @results = RmCustom.get("/search.json?q=" + params[:q])
    else
      @results = RmCustom.get("/resolve.json?id=" + params[:id])
    end
    
    respond_to do |format|
      format.json { render :json => @results }
    end
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
