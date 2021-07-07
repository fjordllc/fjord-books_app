Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  resources :books
  root 'books#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
