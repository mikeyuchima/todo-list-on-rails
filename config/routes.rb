Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items do
     member do
      patch :complete
     end
   end
 end
  
  get '/login' => 'session#new'
  get '/logout' => 'session#destroy'
  post '/login' => 'session#create'

  get '/signup' => 'user#create'

  root "todo_lists#index"
end
  