class ApplicationController < ActionController::Base



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters


devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :category, :is_tradie, :company, :phone, :firstname, :lastname, :dob, :bio, :skills, :address, :city, :sate, :postcode, :car, :equipment, :whitecard, :abn, :price ])
devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :category, :is_tradie, :company, :phone, :firstname, :lastname, :dob, :bio, :skills, :address, :city, :sate, :postcode, :car, :equipment, :whitecard, :abn, :price ])

  
  end

  

end