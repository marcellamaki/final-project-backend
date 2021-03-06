Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     resources :users, only: [:index, :create, :destroy]
     resources :questions, only: [:index, :create, :destroy]
     resources :reminders, only: [:index, :create, :destroy]
     resources :checkins, only: [:index, :create, :destroy]
     resources :appointments, only: [:index, :create, :destroy]


     post '/users/new', to: 'users#create'
     post '/login', to: 'users#authenticate'
     post '/login', to: 'users#authenticate'
     get '/questions', to: 'questions#index'
     get '/getUser', to: 'users#get_user'
     post '/users/:id/questions', to: 'questions#index'
     post '/checkin', to: 'checkins#create'
     delete '/questions/:id', to: 'questions#destroy'

   end
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
