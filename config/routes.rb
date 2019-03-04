Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    resources :claims, only: %i[create]
  end
  root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
