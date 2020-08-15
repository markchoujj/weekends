# == Schema Information
#
# Table name: premises
#
#  id         :bigint           not null, primary key
#  address    :string
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

class Premise < ApplicationRecord
  has_many :premise_drinks
  has_many :drinks, through: :premise_drinks

  def get_distance(coordinates)
    Geocoder::Calculations.distance_between([latitude, longitude], coordinates, units: :km)
  end
end
