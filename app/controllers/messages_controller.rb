class MessagesController < ApplicationController
  # POST /messages
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        Resque.enqueue(MessageSender, @message.id)
        format.html { redirect_to(@message, :notice => 'Message was queued successfully.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  # GET /messages/1
  def show
    @message = Message.find_by_id(params[:id])

    # Ensure date format matches what JS produces (for visual consistency)
    unless @message.expires.nil?
      @message.expires = @message.expires.to_date.to_s.strip
    else
      @message.expires = "None"
    end
    
    @recipients = RmCustom.get("/resolve.json?ids=" + @message.recipient_ids.join(','))
    
    respond_to do |format|
      format.html
    end
  end
  
  # POST /messages/1
  def update
    
  end
end
