Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  get '/users', to:'users#index'
  get '/users/:id', to:'users#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to:"homes#index"
end
