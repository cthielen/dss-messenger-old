class MessageMailer < ActionMailer::Base
  default :from => "ithelp@dss.ucdavis.edu"
  
  def regular_message(message)
    @message = message
    h = {
      :recipients => "Undisclosed Recipients <nobody@ucdavis.edu>",
      :from     => message.sender.email,
      :subject  => message.subject,
      :bcc      => message.recipient_emails
    }
    mail(h)
  end
end
