class SmsProvider
  include Singleton

  def send(msg)
    raise NotImplementedError.new
  end

end