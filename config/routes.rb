Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_scope :user do

    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'

  end


scope module: :public do
  root 'homes#top'
  get 'users/unsubscribe'
  delete 'users/withdraw'
  resources :users, only: [:index, :edit, :show, :update, :unsubscribe, :withdraw] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
     member do
      get :favorites
    end

  collection do
    get 'search'
  end

  end

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do

     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]

  end
end

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
  end
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
