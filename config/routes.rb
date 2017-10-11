Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin, path: '/admin' do
    get "/" => "dashboard#index", as: 'admin'
    resources :categories, except: [:edit, :update]
    resources :articles, except: :show
    resources :banners, except: :destroy
    resources :activities
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
  get 'shop' => 'pages#shop', as: 'shop'
  get 'about' => 'pages#about', as: 'about'

  get 'page/:page' => 'pages#index'
  get 'c/:sort/page/:page' => 'pages#category'
end
