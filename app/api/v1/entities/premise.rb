module V1
  module Entities
    class Premise < Base
      expose :address, :close_time, :gaming, :heat, :latitude, :longitude, :license_no,
      :name, :post_code, :suburb, :created_at
      expose :drinks do |premise|
        V1::Entities::Drink.represent( premise.drinks, premise: premise )
      end
    end
  end
end