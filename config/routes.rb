Rails.application.routes.draw do

    # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
   devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
   }

  # 顧客のルーティング
  scope module: :public do
    root to: 'homes#top'

    get '/about' =>'homes#about'
    get '/customers/show' =>'customers#show'
    get '/customers/infomation/edit' =>'customers#edit'
    patch '/customers/infomation' =>'customers#update'
    get '/customers/withdraw_check' =>'customers#withdraw_check'
    patch  '/customers/withdraw' =>'customers#withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/conplete' => 'orders#complete'

    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:create,:destroy]
    resources :orders, only:[:index,:show,:new,:create]
  end

   # 管理者側のルーティング設定
  namespace :admin do
  resources :genres ,only:[:create,:update,:edit,:index]
  resources :items , only:[:create,:update,:edit,:index,:new,:show]
  resources :customers , only:[:update,:edit,:index,:show]
  resources :orders , only:[:index,:show]
  end


end
