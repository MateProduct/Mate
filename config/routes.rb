Rottenpotatoes::Application.routes.draw do
  resources :users
  # map '/' to be a redirect to '/users'
  root :to => redirect('/users')
  get "/signup", to:"users#signup"
  post "/signup", to:"users#create"
  # get ""
  get "/profile/:uni", to:"users#profile", as: :profile
  put "/profile/:uni", to:"users#update", as: :update
  get "/course/:uni", to:"users#course", as: :course
  post "/signin", to:"users#checkpwd"
  get "/signin", to:"users#signin"

  resources :courses
  get "/add_course/:uni", to:"courses#addcourse"
  post "/add_course/:uni", to:"courses#add_course", as: :add_course
  get "/course_sec/:uni/:course_no/:sec_no", to:"courses#course_sec", as: :course_sec
end
