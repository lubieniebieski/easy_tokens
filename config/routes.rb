EasyTokens::Engine.routes.draw do
  root to: "tokens#index"
  resources :tokens
end
