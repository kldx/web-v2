Rails.application.routes.draw do
  namespace :admin, path: '/admin' do
    get "/" => "dashboard#index", as: 'admin'
    resources :categories, except: [:edit, :update]
    resources :articles, except: :show
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
end
