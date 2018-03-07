Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :households, only: [:index, :show, :create] do
        resources :members, only: [:create]
        resources :engagements, only: [:create]
        resources :notes, only: [:create]
        resources :meals, only: [:index] do
          resources :household_meals, only: [:create]
        end
        # post '/:meal_id/meals', to: 'households#add_meal'
        post '/convert', to: 'households#convert'
      end
      resources :members, only: [:index]
      resources :users, only: [:create]
      resources :meals, only: [:create, :index] do 
        resources :meal_notes, only: [:create]
      end
      post '/engagements/:engagement_id/meals/:meal_id/engagement_meals', to: 'engagement_meals#create'
      post '/auth', to: 'auth#login'
      post '/auth/refresh', to: 'auth#refresh'

    end
  end
end
