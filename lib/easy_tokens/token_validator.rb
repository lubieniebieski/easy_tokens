module EasyTokens
  class TokenValidator
    def self.valid?(token)
      Token.exists?(value: token, deactivated_at: nil)
    end
  end
end
