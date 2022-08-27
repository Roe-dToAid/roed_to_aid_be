class State < ApplicationRecord
  has_many :resources
  has_many :authorized_clinics
  has_many :misinformation_centers
end
