Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root "public_recipes#index"

  resources :recipes, only: [:index]
  resources :users do 
    resources :recipes, except: [:update, :edit]
  end

  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]

end
