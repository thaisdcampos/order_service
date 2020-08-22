class Order < ApplicationRecord
  NAME_REGEX = /\A[[:alpha:] '-]+\z/
  PHONE_REGEX = /\A\(\d{2}\)\s\d{4,5}\-\d{4}\z/i
  EMAIL_REGEX = /\A[-a-z0-9~!$%^&*_=+}{\'?]+(\.?[-a-z0-9~!$%^&*_=+}{\'?]+\.?)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.([a-z]{1,7})|([0-9]{1,7}\.[0-9]{1,7}\.[0-9]{1,7}\.[0-9]{1,7}))(:[0-9]{1,5})?\z/i

  belongs_to :address

  validates :name, :phone, :email, presence: true
  validates :name, length: { minimum: 2 }, format: { with: NAME_REGEX, on: :create }
  validates :phone, format: { with: PHONE_REGEX, on: :create }
  validates :email, format: { with: EMAIL_REGEX, on: :create }
end
