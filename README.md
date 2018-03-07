# README

Here is very simple spammer-app. It was created for doing one-time SMS campaign to spam Itexus company employees :)

All the work is done by [SmsSenderService.publish_wishes](app/services/sms_sender_service.rb)

It is possible to send SMS  via Twilio or Amazon SNS services:

```@provider = TwilioSms.instance```

or 

```@provider = AmazonSns.instance```

Both providers implement [SmsProvider](app/models/sms_provider.rb) interface

Providers' configuration can be placed into environment file:

```ruby
  config.aws_credentials = {
      region: ENV.fetch('AWS_REGION'),
      aws_key: ENV.fetch('AWS_KEY'),
      secret_key: ENV.fetch('AWS_SECRET_KEY')
  }

  config.twilio_credentials = {
      number: ENV.fetch('TWILIO_NUMBER'),
      account_sid: ENV.fetch('TWILIO_SID'),
      auth_token: ENV.fetch('TWILIO_AUTH_TOKEN')
  }
```

