Rails.application.routes.draw do

  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: "public/homes#top"

devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

scope module: :public do
  resources :recipes do
    resource :my_recipes, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end

  get "/users/:id/recipes" => "users#show", as: 'user_recipes'
  get "/users/:id/share_recipes" => "users#share_recipes", as: 'user_share_recipes'
  get "/users/:id/my_recipes" => "users#my_recipes", as: 'user_my_recipes'

  resources :users, only: [:edit, :update]
end

namespace :admin do
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :recipes, only: [:index, :show, :destroy] do
    resources :recipe_comments, only: [:destroy]
  end
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
