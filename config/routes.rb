Rails.application.routes.draw do
  namespace :public do
    resources :users, only: [:show, :edit,:update]
  end

  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
   devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
   }

   # 管理者側のルーティング設定
   namespace :admin do
   get '/' =>'homes#top'
  end

  # 顧客のルーティング
  get '/' =>'public/homes#top'


end
