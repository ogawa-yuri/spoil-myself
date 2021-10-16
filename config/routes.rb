Rails.application.routes.draw do
  resources :tasks do
    member do
      post :toggle
    end
  end
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  resources :users, only:[:show]
  resources :rewards
end
