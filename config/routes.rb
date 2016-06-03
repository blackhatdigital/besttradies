Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
 
  root 'pages#home'
  
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/privacy'

  get '/jobs' => 'jobs#index'
  
  get 'jobs/new'

  get '/myjobs' => 'jobs#myjobs'
  get '/myclosedjobs' => 'jobs#myclosedjobs'
  get '/myawards' => 'jobs#myawards'
  get '/myproposals' => 'proposals#myproposals'

  resources :tradies
  resources :jobs do
    resource :proposals, except: :index
    collection do
      get :search
    end
  end

  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  get 'myjobs' => 'jobs#myjobs', :as => 'user_root'

end
