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

namespace :public do
  get 'relationships/followings'
  get 'relationships/followers'
end

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
  get "/users/:id/followings" => "users#followings", as: 'user_followings'
  get "/users/:id/followers" => "users#followers", as: 'user_followers'

  resources :users, only: [:edit, :update] do
    resource :relationships, only: [:create, :destroy]
    # get "followings" => "relationships#followings", as: "followings"
    # get "followers" => "relationships#followers" , as: "followers"
  end
end

namespace :admin do
  root 'users#index'
  resources :users, only: [:show, :edit, :update]
  resources :recipes, only: [:index, :show, :destroy] do
    resources :recipe_comments, only: [:destroy]
  end
  resources :production_areas, only: [:index, :create, :edit, :update]
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
