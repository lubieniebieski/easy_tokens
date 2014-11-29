require_dependency 'easy_tokens/application_controller'

module EasyTokens
  class TokensController < ::ApplicationController
    before_action :authorize!
    before_action :set_token, only: [:show, :edit, :update, :destroy]

    layout false

    def index
      @tokens = Token.all
    end

    def show
    end

    def new
      @token = Token.new
    end

    def edit
    end

    def create
      @token = Token.new(token_params)
      @token.owner= send(EasyTokens.token_owner_method)

      if @token.save
        redirect_to @token, notice: 'Token was successfully created.'
      else
        render :new
      end
    end

    def update
      if @token.update(token_params)
        redirect_to @token, notice: 'Token was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_token
      @token = Token.find(params[:id])
    end

    def token_params
      params.require(:token).permit(:description)
    end

    def authorize!
      return if owner_resource.public_send EasyTokens.owner_authorization_method
      render text: 'Unauthorized', status: :unauthorized
    end

    def owner_resource
      send EasyTokens.token_owner_method
    end
  end
end
