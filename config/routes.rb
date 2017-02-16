Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks do
    patch  "bookings/:id", to: "bookings#accept_booking", as: :confirm_booking
    put  "bookings/:id", to: "bookings#refuse_booking", as: :refuse_booking
    resources :bookings, only: [:create, :destroy]
  end

  get 'mine', to: 'artworks#mine', as: :mine
  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
  get '/dashboard', to: 'dashboard#index'
  get '/profile', to: 'profile#index'
  post '/subscribe', to: 'pages#subscribe'
end
