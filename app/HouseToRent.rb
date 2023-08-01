class HouseToRent < ActiveRecord::Base
    belongs_to :landlord
    attr_accessor :name, :address, :price_per_month, :price_to_buy
  end