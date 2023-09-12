Rails.application.routes.draw do
  devise_for :users

  # root to: "devise/session#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'pages/privacy', to: 'pages#privacy'
  get 'pages/benefit', to: 'pages#benefit'
  get 'pages/faq', to: 'pages#faq'
  resources :books
  resources :bookings
  get '/librarians/show_members', to: 'librarians#show_members', as: 'show_members'
  get '/memberprofiles', to: 'member_profiles#profile'
  get '/adminprofiles', to: 'admin_profiles#profile'
  get '/user_details', to: 'admin_profiles#user_detail'
  delete '/destroy_user/:id/', to: 'admin_profiles#destroy_user'
  get "/booked_book", to: "bookings#booked_book"
  post "/reserve", to: "reservations#reserve"
  get "/reserve_book", to: "reservations#index"


end
