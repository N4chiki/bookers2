Rails.application.routes.draw do

  devise_for :users
  get "/" => "homes#top", as: "root"
  get "/home/about" => "homes#about", as: "about"

  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :create, :edit, :index, :show, :destroy, :update]

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

