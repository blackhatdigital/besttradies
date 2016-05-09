Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :tradies

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/privacy'

  resources :jobs do
    resource :proposals, except: :index
    collection do
      get :search
    end
  end

  get '/myjobs' => 'jobs#myjobs'
  get '/myclosedjobs' => 'jobs#myclosedjobs'
  get '/myawards' => 'jobs#myawards'
  get '/myproposals' => 'proposals#myproposals'

  root 'jobs#index'

  devise_for :users
  get 'myjobs' => 'jobs#myjobs', :as => 'user_root'

end
