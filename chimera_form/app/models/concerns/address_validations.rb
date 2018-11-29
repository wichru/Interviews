module AddressValidations
  extend ActiveSupport::Concern

  included do
    validates :street, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    # validates :zip_code, presence: true, zipcode: { country_code: :pl }
  end
end
