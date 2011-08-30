class MessagesController < ApplicationController
  # POST /messages
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to(@message, :notice => 'Message was queued successfully.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  # GET /messages/1
  def show
    @message = Message.find_by_id(params[:id])

    respond_to do |format|
      format.html
    end
  end
  
end