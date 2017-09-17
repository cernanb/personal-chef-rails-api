Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :households, only: [:index, :show, :create] do
        resources :meals, only: [:index] do
          resources :household_meals, only: [:create]
        end
        # post '/:meal_id/meals', to: 'households#add_meal'
        post '/convert', to: 'households#convert'
      end
      resources :users, only: [:create] 
      resources :meals, only: [:create, :index]
      post '/auth', to: 'auth#login'
      post '/auth/refresh', to: 'auth#refresh'

    end
  end
end
