class Landlord < ActiveRecord::Base
  has_many :houses
end