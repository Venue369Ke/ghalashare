Rails.application.routes.draw do
  resources :warehouse_categories
  mount RailsAdmin::Engine => '/cipher', as: 'rails_admin'
  resources :services
  resources :connections
  resources :equipment
  resources :configs
  resources :certificates
  resources :warehousetypes
  resources :sector_experiences
  resources :operating_hours
  resources :addresses


  #assignments
  resources :assignments

  # Warehouses
  resources :warehouses do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'listing'
      get 'location'
      get 'preload'
      get 'preview'
    end
      resources :photos, only: [:create, :destroy]
      resources :reservations, only: [:create]
      resources :calendars
  end
  resources :guest_reviews, only: [:create,:destroy]
  resources :host_reviews, only: [:create,:destroy]
  get '/your_storages'=>'reservations#your_storage_bookings'
  get '/your_reservations' => 'reservations#your_reservations'

  get 'search' => 'pages#search'
  get 'edit_payout' => 'users#edit_payout'
  resources :companies
  root to: 'pages#home'
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  # root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end


  #=====AirKong====#

  post 'create_subaccount' =>'users#create_subaccount'

  get 'dashboard' =>'dashboards#index'
  resources :reservations, only: [:approve, :decline] do
      member do
        post '/approve' => "reservations#approve"
        post '/decline' => "reservations#decline"
      end

    end
 resources :revenues, only: [:index]

 resources :conversations, only: [:index, :create] do
   resources :messages, only: [:index, :create]

get '/auth/stripe_connect/callback' =>'omniauth_callbacks#stripe_connect'

 end

    get '/host_calendar' => "calendars#host"

    get '/payment_method' => 'users#payment'
        get '/payout_method' => 'users#payout'
    post '/add_card' => 'users#add_card'


    get '/notification_settings' => 'settings#edit'
    post '/notification_settings' => 'settings#update'

    get '/notifications' => 'notifications#index'

    mount ActionCable.server => '/cable'


#Denswami
get '/privacy_policy' => 'pages#privacy_policy'

# Dynamic error pages
 get "/404", to: "errors#not_found"
 get "/422", to: "errors#unacceptable"
 get "/500", to: "errors#internal_error"

end
