class SmsSenderService

  def initialize
    @provider = TwilioSms.instance #AmazonSns.instance
  end

  def publish_wishes
    templates = MessageTemplate.where(msg_type: 'wish').all
    templates_ids = templates.map(&:id)
    recipients = Recipient.all
    recipients.each do |recipient|
      sent_messages = recipient.messages.pluck('DISTINCT template_id')
      random_template_id = 0
      (templates_ids - sent_messages).tap {|ids| random_template_id = ids.size > 0 ? ids[rand(0..(ids.size - 1))] : -1}
      template = random_template_id > 0 ? templates.find {|t| t.id == random_template_id} : nil
      if template
        msg = Message.new(template: template, recipient: recipient,
                          content: template.content)
        begin
          @provider.send(msg)
          msg.save!
        rescue Exception => e
          puts "Cannot send SMS to #{recipient.phone}"
          Rails.logger.debug e.message
          Rails.logger.debug e.backtrace.inspect
        end
      end
    end
  end

end