class SiteController < ApplicationController
  def index
    @message = Message.new
  end
  
  def search
    @results = RmCustom.get("/search.json?q=" + params[:q])
    
    respond_to do |format|
      format.json { render :json => @results }
    end
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
