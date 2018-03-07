class TwilioSms < SmsProvider

  def initialize
    twilio_creds = Rails.configuration.twilio_credentials || {}
    @twilio_number = twilio_creds[:number]
    @client = Twilio::REST::Client.new(twilio_creds[:account_sid], twilio_creds[:auth_token])
  end

  def send(msg)
    @client.api.account.messages.create(
        :from => @twilio_number,
        :to => msg.recipient.phone,
        :body => msg.content
    )
  end

end