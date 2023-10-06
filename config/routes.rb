Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    passwords: 'users/passwords' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  root 'users#index'

  # Route to list all users
  # Route to show a specific user
  resources :users, only: %i[index show] do
    # Route to show all posts of a specific user
    # Route to show a specific post of a specific user
    resources :posts, only: %i[index new create show] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end