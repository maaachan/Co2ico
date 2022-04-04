Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
  root 'homes#top'
  #resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  #resources :users, only: [:edit, :show, :unsubscribe, :update, :withdraw]
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
