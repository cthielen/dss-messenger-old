class MessageMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def regular_message(message)
    recipients "cmthielen@ucdavis.edu"
    from "nobody@example.com"
    subject message.subject
    body :message => message
  end
end
