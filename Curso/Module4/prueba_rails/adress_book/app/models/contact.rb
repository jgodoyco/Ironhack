class Contact < ApplicationRecord

  validates :name, :adress, :phone_number, :email_address, confirmation: true

end