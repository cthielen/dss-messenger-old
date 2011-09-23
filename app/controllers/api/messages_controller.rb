class Api::MessagesController < Api::BaseController
  # GET /api/messages/person_id
  def show
    user = Person.find(params[:id])

    @messages = []

    # Magic numbers here: 1 and 2 are the message types involving "portal inbox" type messages
    # Look up messages sent directly to them
    m = Message.includes(:recipients).where(:message_type_id => [1, 2], :recipients => {:uid => user.id})
    @messages = @messages + m.flatten

    # Look up messages sent to their OUs
    user.groups.each do |group|
      m = Message.includes(:recipients).where(:message_type_id => [1, 2], :recipients => {:uid => group.id})
      @messages = @messages + m.flatten
    end
    
    # Look up messages sent to their groups
    user.ous.each do |ou|
      m = Message.includes(:recipients).where(:message_type_id => [1, 2], :recipients => {:uid => ou.id})
      @messages = @messages + m.flatten
    end

    respond_to do |format|
      format.xml
    end
  end
end
