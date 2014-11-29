require_relative 'token_validator'

module EasyTokens
  module Authorization
    extend ActiveSupport::Concern

    module ClassMethods
      def check_token_on(*action_names)
        before_filter :validate_token, only: action_names
      end
    end

    def validate_token
      if params[:token].present?
        return if TokenValidator.valid?(params[:token])
        token_invalid and return
      else
        token_required
      end
    end

    def token_required
      render text: 'Token required', status: :bad_request
    end

    def token_invalid
      render text: 'Token is invalid', status: :forbidden
    end
  end
end
