require_relative 'authorization'
require_relative 'grape'

module EasyTokens
  class Engine < ::Rails::Engine
    isolate_namespace EasyTokens

    initializer 'easy_tokens.controller_extensions' do
      if Object.const_defined?('ActionController::Base')
        ActionController::Base.send(:include, EasyTokens::Authorization)
      end
    end
  end
end
