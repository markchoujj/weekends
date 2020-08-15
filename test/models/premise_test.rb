# == Schema Information
#
# Table name: premises
#
#  id         :bigint           not null, primary key
#  address    :string
#  close_time :integer
#  gaming     :boolean
#  heat       :integer
#  latitude   :decimal(10, 7)
#  license_no :string
#  longitude  :decimal(10, 7)
#  name       :string
#  post_code  :string
#  suburb     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PremiseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
