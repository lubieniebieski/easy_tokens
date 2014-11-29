module EasyTokens
  class Token < ActiveRecord::Base
    after_initialize :ensure_token_presence

    private

    def ensure_token_presence
      self.value ||= SecureRandom.hex(16)
    end
  end
end
