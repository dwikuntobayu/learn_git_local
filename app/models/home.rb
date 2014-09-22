class Home < ActiveRecord::Base
  has_many :families_homes
  has_many :families, through: :families_homes
end
