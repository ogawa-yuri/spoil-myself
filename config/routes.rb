Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'schedules/index'
  resources :tasks do
    member do
      post :toggle
    end
  end
  root 'pages#home' 

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords:     'users/passwords',
  }

  post '/guest_sign_in' => 'homes#guest'
  post '/homes/admin_sign_in' => 'homes#admin_sign_in'

  resources :users, only:[:show]
  resources :rewards
  resources :schedules
end
