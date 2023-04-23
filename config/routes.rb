Rails.application.routes.draw do
  get '/users/acount' => "users#acount"
  get '/users/profile' => "users#profile"
  post 'users/profile' => "profiles#update"
  get '/users/profiles/edit' => "profiles#edit"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#top"
  get "/" => "home#top"
  get "/index" => "home#index"

  resources :users
  resources :rooms do
    collection do
      get 'search'
    end
  end
  resources :reservations

end
