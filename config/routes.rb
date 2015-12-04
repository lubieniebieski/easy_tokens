EasyTokens::Engine.routes.draw do
  root to: 'tokens#index'
  resources :tokens, except: [:show, :destroy] do
    get :deactivate_token
  end
end
