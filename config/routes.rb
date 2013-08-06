GithubOauth::Application.routes.draw do
  root to: 'sessions#index'

  resources :sessions, only: [:index, :new, :create]

  get 'oauth2callback' => 'sessions#oauth2callback'
end
