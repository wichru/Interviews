module CompanyValidations
  extend ActiveSupport::Concern

  included do
    validates :company_name, length: { maximum: 200 }
  end
end
