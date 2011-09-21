class Api::MessagesController < Api::BaseController
  # GET /api/messages/person_id
  def show
    @user_id = Person.find(params[:id])

    # Magic numbers here: 1 and 2 are the message types involving "portal inbox" type messages
    @messages = Message.includes(:recipients).where(:message_type_id => [1, 2], :recipients => {:id => @user_id.id})

    respond_to do |format|
      format.xml
    end
  end
end
