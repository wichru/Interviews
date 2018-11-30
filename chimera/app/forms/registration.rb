require "pry"

class Registration
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :email, :password, :password_confirmation,
                :first_name, :last_name, :date_of_birth, :phone_number,
                :street, :city, :zip_code, :country, :company_name,
                :company_street, :company_city, :company_zip_code, :company_country
  attr_reader :params

  include UserValidations

  validates :password, presence: true, length: { minimum: 6 }
  validate :password_confirmation_is_the_same_as_password

  def initialize(params = nil)
    if params
      @params = params
      super(params)
    end
  end

  def submit!
    if valid?
      ActiveRecord::Base.transaction do
        create_user
        create_address
        create_company
        create_company_address
        return true
      end
    end

    false
  end

  def user
    @user ||= User.new(user_params)
  end

  def company
    @company ||= user.build_company(company_params)
  end

  private

  def create_user
    user.save(user_params)
  end

  def create_address
    user.create_address(address_params)
  end

  def create_company
    company.save(company_params)
  end

  def create_company_address
    company.create_address(company_address_params)
  end

  def user_params
    params.slice(:email, :password, :first_name, :last_name, :date_of_birth, :phone_number)
  end

  def address_params
    params.slice(:street, :city, :zip_code, :country)
  end

  def company_params
    params.slice(:company_name)
  end

  def company_address_params
    params.slice(:company_street, :company_city, :company_zip_code, :company_country)
  end

  def password_confirmation_is_the_same_as_password
    unless password_confirmation == password
      errors.add(:password_confirmation, "is not the same as password")
    end
  end

end
