require "pry"

class RegistrationsController < Devise::RegistrationsController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.submit!
      sign_in(@registration.user)
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def registration_params
    params.require(:registration).permit(
      :email, :password, :password_confirmation, :current_password,
      :first_name, :last_name, :date_of_birth, :phone_number,
      :street, :city, :zip_code, :country, :company_name,
      :company_street, :company_city, :company_zip_code, :company_country
    )
  end
end
