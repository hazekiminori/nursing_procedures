Rails.application.routes.draw do
  get 'procedure_category_relations/add_user'
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/search' => 'searches#search'

  namespace :admin do
    resources :categories, only: %i[index create edit update new show destroy]
    resources :users, only: %i[index show edit update]
    resources :procedures, only: %i[show edit update create new destroy] do
      resources :procedure_changes, only: [:destroy]
    end
    get '/index/:category', to: 'procedure#index'
    # resources :procedure_category_relations, only:[:create, :new, :show]
  end

  scope module: :public do
    resources :categories, only: %i[index show]
    get '/users/my_page' => 'users#show', as: 'my_page'
    resource :users, only: [:show]
    patch '/users/information' => 'users#update', as: 'update_users'
    get '/users/information/edit' => 'users#edit', as: 'edit_users'
    get 'users/quit' => 'users#quit', as: 'quit'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :procedures, only: %i[new edit create update show index] do
      resource :bookmarks, only: %i[create destroy]
      resources :procedure_changes, only: %i[create destroy]
    end

    get '/bookmarks' => 'bookmarks#index'
    delete 'bookmarks/destroy_all' => 'bookmarks#destroy_all', as: 'destroy_all'
    # resources :procedure_category_relations, only:[:create, :new, :show]
  end
end
