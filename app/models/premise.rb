# == Schema Information
#
# Table name: premises
#
#  id         :bigint           not null, primary key
#  address    :string
#  gaming     :boolean
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
end
