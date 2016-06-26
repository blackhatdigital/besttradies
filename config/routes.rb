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
  get '/mytradies' => 'jobs#mytradies'
  get '/myawards' => 'jobs#myawards'

  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end



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
