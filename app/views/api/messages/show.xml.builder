xml.instruct!

xml.messages("type"=>"array") do
  @messages.each do |message|
    xml.message do
      xml.subject message.subject
      xml.body message.body
      xml.url message.url
      xml.sent message.created_at
    end
  end
end
