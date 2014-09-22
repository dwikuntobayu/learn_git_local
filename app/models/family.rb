class Family < ActiveRecord::Base
  has_many :families_homes
  has_many :homes, through: :families_homes
end
