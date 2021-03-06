class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  # For Dev environment

  # def send_message(user)
  #   client = Twilio::REST::Client.new(
  #     Rails.application.credentials.twilio[:twilio_account_sid],
  #     Rails.application.credentials.twilio[:twilio_auth_token]
  #     )
  #   client.messages.create({
  #     from: Rails.application.credentials.twilio[:twilio_phone_number],
  #     to: user.text_number,
  #     body: @message
  #   })
  # end

  def send_message(text_number)
    p 'Sending message'
    client = Twilio::REST::Client.new(
      ENV["twilio_account_sid"],
      ENV["twilio_auth_token"]
      )
    client.messages.create({
      from: ENV["twilio_phone_number"],
      to: text_number,
      body: @message
    })
  end
end

