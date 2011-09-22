xml.instruct!

xml.response do
  xml.messages("type" => "array") do
    @messages.each do |message|
      xml.message do
        xml.from_id message.sender.id
        xml.from message.sender.name
        xml.subject message.subject
        xml.body message.body
        xml.url message.url
        xml.sent message.created_at
      end
    end
  end
end
