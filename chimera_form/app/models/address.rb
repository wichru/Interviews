class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  include AddressValidations
end
