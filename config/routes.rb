Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "referrer#index"
  resources :referrer, only: [:index, :create]
end
