Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'users' => 'users#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => 'users#show'
  resources :books
  root 'books#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

