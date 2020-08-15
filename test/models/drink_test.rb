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

require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
