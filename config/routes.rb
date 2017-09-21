Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     resources :users, only: [:index, :create, :destroy]
     resources :questions, only: [:index, :create, :destroy]
     resources :reminders, only: [:index, :create, :destroy]
     resources :reminder_times, only: [:index, :create, :destroy]

     post '/users', to: 'users#create'

   end
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
