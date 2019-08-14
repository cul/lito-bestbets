Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
    if Rails.env.development?
      get 'sign_in_developer', :to => 'users/sessions#developer_new', :as => :developer_new_user_session
    end
  end

  resources :key_resources

  root to: redirect('key_resources')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
