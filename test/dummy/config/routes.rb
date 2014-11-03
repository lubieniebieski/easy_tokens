Rails.application.routes.draw do
  mount EasyTokens::Engine => "/easy_tokens"
end
