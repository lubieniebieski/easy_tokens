EasyTokens::Engine.routes.draw do
  root to: 'tokens#index'
  resources :tokens, except: [:destroy]
end
