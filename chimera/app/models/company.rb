class Company < ApplicationRecord
  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address

  validates :date_of_birth, format: { with: /\A\d{2}\/\d{2}\/\d{4}\Z/ }
end
