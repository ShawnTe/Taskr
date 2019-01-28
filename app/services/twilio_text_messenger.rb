class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def send_message
    client = Twilio::REST::Client.new(
      ENV["twilio_account_sid"],
      ENV["twilio_auth_token"]
      )
    client.messages.create({
      from: ENV["twilio_phone_number"],
      to: current_user.text_number,
      body: @message
    })
  end
end

