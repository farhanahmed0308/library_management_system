Rails.application.routes.draw do
  devise_for :users, controllers: {

    registrations: 'user/registrations'
  }
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
end
