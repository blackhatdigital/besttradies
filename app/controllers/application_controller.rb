class ApplicationController < ActionController::Base
    

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :is_tradie
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
    devise_parameter_sanitizer.for(:sign_up) << :dob
    devise_parameter_sanitizer.for(:sign_up) << :bio
    devise_parameter_sanitizer.for(:sign_up) << :skills
    devise_parameter_sanitizer.for(:sign_up) << :address
    devise_parameter_sanitizer.for(:sign_up) << :city
    devise_parameter_sanitizer.for(:sign_up) << :state
    devise_parameter_sanitizer.for(:sign_up) << :postcode
    devise_parameter_sanitizer.for(:sign_up) << :car
    devise_parameter_sanitizer.for(:sign_up) << :equipment
    devise_parameter_sanitizer.for(:sign_up) << :whitecard
    devise_parameter_sanitizer.for(:sign_up) << :abn
    devise_parameter_sanitizer.for(:sign_up) << :price

    devise_parameter_sanitizer.for(:account_update) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :firstname
    devise_parameter_sanitizer.for(:account_update) << :lastname
    devise_parameter_sanitizer.for(:account_update) << :dob
    devise_parameter_sanitizer.for(:account_update) << :bio
    devise_parameter_sanitizer.for(:account_update) << :skills
    devise_parameter_sanitizer.for(:account_update) << :address
    devise_parameter_sanitizer.for(:account_update) << :city
    devise_parameter_sanitizer.for(:account_update) << :state
    devise_parameter_sanitizer.for(:account_update) << :postcode
    devise_parameter_sanitizer.for(:account_update) << :car
    devise_parameter_sanitizer.for(:account_update) << :equipment
    devise_parameter_sanitizer.for(:account_update) << :whitecard
    devise_parameter_sanitizer.for(:account_update) << :abn
    devise_parameter_sanitizer.for(:account_update) << :price

  end

  

end
