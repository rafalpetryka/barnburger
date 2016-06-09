Rails.application.routes.draw do
  devise_for :admins
  resources :news
  resources :burgers
  resources :limited_burgers
  resources :english_news
  resources :english_limited_burgers
  resources :english_burgers
  resources :opening_hours, only: [:edit, :update, :index]
  resources :home_descriptions, only: [:edit, :update, :index]
  get 'privacy' => 'main#privacy'
  get 'main/index' => 'main#index'
  get 'manager' => 'manager#index'
  get "menu" => redirect("http://localhost:3000/#menu")
  root 'main#index'
end
