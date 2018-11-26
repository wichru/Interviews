class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :email,
        :password,
        :first_name,
        :last_name,
        :date_of_birth,
        :phone_number,
        company: [:name],
        address: [:street, :city, :zip_code, :country]
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :email,
        :password,
        :current_password,
        :first_name,
        :last_name,
        :date_of_birth,
        :phone_number,
        company: [:name],
        address: %i[street city zip_code country]
      )
    end
  end
end
