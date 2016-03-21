module EasyTokens
  module Grape
    def check_api_token(token)
      error!('Invalid token', 401) unless EasyTokens::TokenValidator.valid?(token)
    end
  end
end
