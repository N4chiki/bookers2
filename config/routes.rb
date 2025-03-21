Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :create, :edit, :index, :show, :destroy, :update]

  get "/homes/about" => "homes#about", as: "about"

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

