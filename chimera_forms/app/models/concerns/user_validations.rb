module UserValidations
  extend ActiveSupport::Concern

  included do
    validates :first_name, presence: true, length: { maximum: 100 }
    validates :last_name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, format: { with: /\A.+@.+\..+\z/ }
  end
end
