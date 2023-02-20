Rails.application.routes.draw do
devise_for :users
root to: "homes#top"
resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
get 'users/index'
get 'users/show'
get 'users/edit'
 get 'homes/about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
