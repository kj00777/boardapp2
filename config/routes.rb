Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  root to: "dashboards#index"

  resources :users, only: [:new, :create]
  resources :user_sessions
  resources :boards do
    resources :comments, only: [:create, :edit, :destroy]
  end
  get "/login" => "user_sessions#new"
  post '/login' => 'user_sessions#create'
  post '/logout' => 'user_sessions#destroy', :as => :logout
end
