class Address < ApplicationRecord
  ZIP_CODE_REGEX = /\A[0-9]{5}\-[0-9]{3}\z/

  has_one :order

  validates :city, :neighborhood, :street, :uf, :zip_code, presence: true
  validates :zip_code, format: { with: ZIP_CODE_REGEX, on: :create }
end
