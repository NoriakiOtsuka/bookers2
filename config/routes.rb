Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  #get 'users/show' #重複避け削除するのかな？
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#top"

  resources :home, only: [:top, :about]

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
