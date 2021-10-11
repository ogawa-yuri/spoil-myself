Rails.application.routes.draw do
  resources :tasks do
    member do
      post :toggle
    end
  end
  root 'pages#home'
  devise_for :users
  # get 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
