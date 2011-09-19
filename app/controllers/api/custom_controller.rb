class Api::CustomController < ActionController::Base
  def flashes
    @messages = Message.find(:all, :conditions => {:flash => true, :expires => Date.today..(Date.today+7) })

    respond_to do |format|
      format.xml { render :xml => @messages, :only => [:subject, :body, :expires, :url] }
      format.json { render :json => @messages, :callback => params[:callback] }
    end
  end
end
