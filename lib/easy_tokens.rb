require "easy_tokens/engine"

module EasyTokens
  mattr_accessor :token_owner_method do
    :current_user
  end
  mattr_accessor :token_owner_class do
    'User'
  end
end
