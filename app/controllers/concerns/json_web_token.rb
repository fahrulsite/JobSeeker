require 'jwt'
require 'dotenv/load'
# require 'dotenv-rails'

module JsonWebToken

  SECRET_KEY = ENV['SECRET_KEY']

  def self.AuthorizeApiRequest(headers = {})
    # puts SECRET_KEY
    # puts headers['Authorization']
    if headers['Authorization'].present?
      token = headers['Authorization'].split(' ').last
      decoded_auth_token = JsonWebToken.decode(token)
      puts decoded_auth_token
      if decoded_auth_token
        user = User.find(decoded_auth_token[:user_id])
        return user if user
      end
    end
    nil
  end

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
