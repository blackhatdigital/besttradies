class ApplicationController < ActionController::Base



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters


    devise_parameter_sanitizer.permit(:sign_up) << :avatar
    devise_parameter_sanitizer.permit(:sign_up) << :category
    devise_parameter_sanitizer.permit(:sign_up) << :is_tradie
    devise_parameter_sanitizer.permit(:sign_up) << :company
    devise_parameter_sanitizer.permit(:sign_up) << :phone
    devise_parameter_sanitizer.permit(:sign_up) << :firstname
    devise_parameter_sanitizer.permit(:sign_up) << :lastname
    devise_parameter_sanitizer.permit(:sign_up) << :dob
    devise_parameter_sanitizer.permit(:sign_up) << :bio
    devise_parameter_sanitizer.permit(:sign_up) << :skills
    devise_parameter_sanitizer.permit(:sign_up) << :address
    devise_parameter_sanitizer.permit(:sign_up) << :city
    devise_parameter_sanitizer.permit(:sign_up) << :state
    devise_parameter_sanitizer.permit(:sign_up) << :postcode
    devise_parameter_sanitizer.permit(:sign_up) << :car
    devise_parameter_sanitizer.permit(:sign_up) << :equipment
    devise_parameter_sanitizer.permit(:sign_up) << :whitecard
    devise_parameter_sanitizer.permit(:sign_up) << :abn
    devise_parameter_sanitizer.permit(:sign_up) << :price

    devise_parameter_sanitizer.permit(:account_update) << :avatar
    devise_parameter_sanitizer.permit(:account_update) << :category
    devise_parameter_sanitizer.permit(:account_update) << :company
    devise_parameter_sanitizer.permit(:account_update) << :phone
    devise_parameter_sanitizer.permit(:account_update) << :firstname
    devise_parameter_sanitizer.permit(:account_update) << :lastname
    devise_parameter_sanitizer.permit(:account_update) << :dob
    devise_parameter_sanitizer.permit(:account_update) << :bio
    devise_parameter_sanitizer.permit(:account_update) << :skills
    devise_parameter_sanitizer.permit(:account_update) << :address
    devise_parameter_sanitizer.permit(:account_update) << :city
    devise_parameter_sanitizer.permit(:account_update) << :state
    devise_parameter_sanitizer.permit(:account_update) << :postcode
    devise_parameter_sanitizer.permit(:account_update) << :car
    devise_parameter_sanitizer.permit(:account_update) << :equipment
    devise_parameter_sanitizer.permit(:account_update) << :whitecard
    devise_parameter_sanitizer.permit(:account_update) << :abn
    devise_parameter_sanitizer.permit(:account_update) << :price

  end

  

end
