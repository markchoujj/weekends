module V1
  module Entities
    class Drink < Base
      expose :id, :age, :advice_price, :brand, :name
      expose :real_price do |drink, opt|
        drink.premise_drinks.find_by(premise_id: opt[:premise].id).price
      end
      expose :amount do |drink, opt|
        drink.premise_drinks.find_by(premise_id: opt[:premise].id).amount
      end
    end
  end
end