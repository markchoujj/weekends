# == Schema Information
#
# Table name: drinks
#
#  id           :bigint           not null, primary key
#  advice_price :decimal(10, 4)
#  age          :integer
#  brand        :string
#  name         :string
#  type         :integer
#  volume       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Drink < ApplicationRecord
  has_many :premise_drinks
  has_many :premises, through: :premise_drinks
end
