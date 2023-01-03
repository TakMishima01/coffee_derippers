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

scope module: :public do
  resources :recipes
end

namespace :admin do
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :recipes, only: [:index, :show, :destroy]
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
