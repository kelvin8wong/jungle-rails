Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end
  
  #order routes
  resources :orders, only: [:create, :show]

  #signup routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #admin routes
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  #login and out routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  #give letter an interface
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
