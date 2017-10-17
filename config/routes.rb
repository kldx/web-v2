require 'sidekiq/web'
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin, path: '/admin' do
    mount Sidekiq::Web, at: '/sidekiq'
    get "/" => "dashboard#index"
    resources :categories, except: [:edit, :update]
    resources :articles, except: :show do
      member do
        patch :published
        patch :unpublish
      end
    end
    resources :banners, except: :destroy
    resources :activities
    namespace :store, path: '/store' do
      get "/dashboard" => "dashboard#index", as: 'dashboard'
      resources :items, except: :show
      resources :orders, except: [:new, :create, :edit, :update, :destroy]
    end
  end

  namespace :dashboard, path: '/dashboard' do
    get "/" => "dashboard#index"
    resources :orders, except: [:new, :create, :edit, :update, :destroy]
  end

  #api
  namespace :api do
    namespace :v1 do
      resources :users, only: :show
      resources :articles, only: [:index, :show]
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end

  root 'pages#index'
  # article show page
  get 'a/:id' => 'pages#show', as: 'article'
  #category
  get 'c/:sort' => 'pages#category', as: 'category'
  get 'activities' => 'pages#activities', as: 'activities'
  get 'crew' => 'pages#crew', as: 'crew'
  get 'about' => 'pages#about', as: 'about'
  # shop/store
  get 'shop' => 'pages#shop', as: 'shop'
  get 'shop/:id' => 'pages#shop_show', as: 'shop_show'
  # public order
  get 'shop/:item_id/orders/new' => 'orders#new', as: 'new_order'
  post 'shop/:item_id/orders/' => 'orders#create', as: 'orders'

  get 'page/:page' => 'pages#index'
  get 'c/:sort/page/:page' => 'pages#category'
end
