class MessageMailer < ActionMailer::Base
  default :from => "ithelp@dss.ucdavis.edu"
  
  def regular_message(message)
    bcc message.recipient_emails
    recipients "Undisclosed Recipients <nobody@ucdavis.edu>"
    from message.sender.email
    subject message.subject
    body :message => message
  end
end
