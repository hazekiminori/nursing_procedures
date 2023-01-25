Rails.application.routes.draw do
  get 'procedure_category_relations/add_user'
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
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
  get "/search" => "searches#search"

  namespace :admin do
    resources :categories, only:[:index, :create, :edit, :update, :new, :show]
    resources :users, only:[:index, :show, :edit, :update]
    resources :procedures, only:[:show, :edit, :update, :create, :new, :destroy]
    get '/index/:category', to: 'procedure#index'
    resources :procedure_category_relations, only:[:create, :new, :show]
  end

  scope module: :public do
    resources :categories, only:[:index, :show]
    get '/users/my_page' => 'users#show', as:'my_page'
    resource :user, only:[:update, :edit]
    #get '/users/information/edit' => 'users#edit'
    #patch '/users/information' => 'users#update'
    get 'users/quit' => 'users#quit', as:'quit';
    patch 'users/withdrawal' => 'users#withdrawal', as:'withdrawal'
    resources :procedures, only:[:new, :edit, :create, :update, :show] do
      resources :procedure_changes, only:[:create, :destroy]
    end
    resource :bookmarks, only:[:create, :destroy]
    get '/bookmarks' => 'bookmarks#index'
    delete 'bookmarks/destroy_all' => 'bookmarks#destroy_all', as:'destroy_all'
    resources :procedure_category_relations, only:[:create, :new, :show]
  end

end

