Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  resources :best_bets
  
  root to: 'best_bets#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
