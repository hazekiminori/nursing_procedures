Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "public/homes#top"
  get '/admin' => 'admin/homes#top'
  
  namespace :admin do
    resources :categories
    resources :users
    resources :changes
    resources :procedures
    resources :bookmarks
  end
  
  scope module: :public do
    resources :categories
    resources :users
    resources :changes
    resources :procedures
    resources :bookmarks
  end
  
end

