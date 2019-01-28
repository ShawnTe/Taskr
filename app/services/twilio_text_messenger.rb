class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def send_message
    client = Twilio::REST::Client.new(
      Rails.application.credentials.twilio[:twilio_account_sid],
      Rails.application.credentials.twilio[:twilio_auth_token]
      )
    client.messages.create({
      from: Rails.application.credentials.twilio[:twilio_phone_number],
      to: current_user.text_number,
      body: @message
    })
  end
end

