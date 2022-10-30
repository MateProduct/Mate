Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get "/signup", to:"movies#signup"
  get "/profile", to:"movies#profile"
  post "/signin", to:"movies#checkpwd"
  get "/signin", to:"movies#signin"
end
