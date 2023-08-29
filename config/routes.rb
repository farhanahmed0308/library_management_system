Rails.application.routes.draw do
  devise_for :users
  # root to: "devise/session#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'pages/privacy', to: 'pages#privacy'
  resources :books
  get '/librarians/show_members', to: 'librarians#show_members', as: 'show_members'
end
