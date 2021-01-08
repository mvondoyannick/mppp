# frozen_string_literal: true
module Token
  class Token
    def initialize(email)
      @email = email
    end

    def gen_key
      exp = Time.now.to_i + 4 * 3600
      exp_payload = { data: @email, exp: exp }

      JWT.encode exp_payload, hmac_secret, 'HS256'
    end
  end

  class SendMailman
    def initialize(data, message)
      @email = data
      @message = message
    end
    def sending
      RestClient.post "https://api:03ee8a853e31d8648cf06b82f7c30dcb-3d0809fb-3486193e" \
           "@api.mailgun.net/v3/sandbox023900a156f3425e819b872335392423.mailgun.org/messages",
                                :from => "MPPP MAILER BOT <mvondoyannick@gmail.com>",
                                :to => @email,
                                :subject => "Hello",
                                :text => @message
    end
  end
end