class MessageMailer < ActionMailer::Base
  default :from => "ithelp@dss.ucdavis.edu"
  
  def regular_message(message)
    recipients message.recipient_emails
    from message.sender.email
    subject message.subject
    body :message => message
  end
end
