class AmazonSns < SmsProvider

  def initialize
    aws_creds = Rails.configuration.aws_credentials || {}
    @sns = Aws::SNS::Client.new(region: aws_creds[:region], access_key_id: aws_creds[:aws_key], secret_access_key: aws_creds[:secret_key])
  end

  def send(msg)
    msg_attributes = {}
    msg_attributes = {"AWS.SNS.SMS.SenderID" => {data_type: 'String', string_value: msg.from}} unless msg.from.blank?
    p msg_attributes
    @sns.publish({phone_number: msg.recipient.phone, message: msg.content, message_attributes: msg_attributes})
  end
end