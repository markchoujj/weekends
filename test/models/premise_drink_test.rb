# == Schema Information
#
# Table name: premise_drinks
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  in_stock   :boolean
#  on_sale    :boolean
#  price      :decimal(10, 4)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  drink_id   :bigint
#  premise_id :bigint
#
# Indexes
#
#  index_premise_drinks_on_drink_id    (drink_id)
#  index_premise_drinks_on_premise_id  (premise_id)
#
# Foreign Keys
#
#  fk_rails_...  (drink_id => drinks.id)
#  fk_rails_...  (premise_id => premises.id)
#

require 'test_helper'

class PremiseDrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
