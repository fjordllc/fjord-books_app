Rails.application.routes.draw do
  get 'user/index'
  devise_for :users, controllers: {registrations: 'user/registrations'}
  resources :users, only: [:index, :show]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'books#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
