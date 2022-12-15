Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: "public/homes#top"
  get '/admin' => 'admin/homes#top'


  namespace :admin do
    resources :categories, only:[:index, :create, :edit, :update]
    resources :users, only:[:index, :show, :edit, :update]
    resources :procedures
    get '/searches' => 'searches#index'
    patch '/searches' => 'searches#searche', as:'admin_searches'
  end

  scope module: :public do
    get '/categories' => 'categories#index'
    get '/categories/:id' => 'categories#show'
    get '/users/my_page' => 'users#show', as:'my_page'
    get '/users/infomation/edit' => 'users#edit'
    patch '/users/infomation' => 'users#update'
    get 'users/quit' => 'users#quit', as:'quit'
    patch 'users/withdrawal' => 'users#withdrawal', as:'withdrawal'
    resources :procedures, only:[:index, :new, :edit, :crate, :update, :show] do
      resources :changes, only:[:create]
    end
    resource :bookmarks, only:[:create, :destroy]
    get '/bookmarks' => 'bookmarks#index'
    delete 'bookmarks/destroy_all' => 'bookmarks#destroy_all', as:'destroy_all'
    resource :searches, only:[:index]
    get '/searches' => 'searches#searches', as:'searches'
  end

end

