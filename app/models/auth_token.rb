# frozen_string_literal: true

class AuthToken
  def self.key
    Rails.application.credentials.auth_token
  end

  def self.token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JsonWebToken.sign(payload, key: key)
  end

  def self.verify(token)
    result = JsonWebToken.verify(token, key: key)
    return nil if result[:error]

    User.find_by(id: result[:ok][:user_id])
  end
end
