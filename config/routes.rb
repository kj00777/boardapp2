Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  root to: "dashboards#index"

  resources :users, only: [:new, :create]
  resources :user_sessions
  resources :boards do
    resources :comments, only: [:create, :edit, :destroy, :update]
    resources :follows, only: [:create, :destroy]
  end

  get "/follows" => "follows#index"
  
  get "/login" => "user_sessions#new"
  post '/login' => 'user_sessions#create'
  post '/logout' => 'user_sessions#destroy', :as => :logout

  resources :password_resets
end
