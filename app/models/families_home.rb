class FamiliesHome < ActiveRecord::Base
  belongs_to :family
  belongs_to :home
end
