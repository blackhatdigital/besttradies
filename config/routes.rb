Rails.application.routes.draw do
  resources :ratings, except: [:show, :index]

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
  get '/myawards' => 'jobs#myawards'

  root 'jobs#index'

  devise_for :users
  get 'myjobs' => 'jobs#myjobs', :as => 'user_root'

end
