Rottenpotatoes::Application.routes.draw do
  resources :users
  # map '/' to be a redirect to '/users'
  root :to => redirect('/users')
  get "/signup", to:"users#signup"
  get "/profile/:uni", to:"users#profile", as: :profile
  put "/profile/:uni", to:"users#update", as: :update
  post "/signin", to:"users#checkpwd"
  get "/signin", to:"users#signin"
end
