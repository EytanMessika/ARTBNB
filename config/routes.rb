Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks do
  get '/contact' => 'pages#contact'
  get '/about' => 'pages#about'
    resources :bookings
  end
  get 'mine', to: 'artworks#mine', as: :mine
end
