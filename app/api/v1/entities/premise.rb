module V1
  module Entities
    class Premise < Base
      expose :id, :address, :close_time, :gaming, :heat, :latitude, :longitude, :license_no,
      :name, :post_code, :suburb, :created_at, :inside, :available
      expose :drinks do |premise, opt|
        if opt[:detail].present?
          V1::Entities::Drink.represent( premise.drinks, premise: premise )
        end
      end
    end
  end
end