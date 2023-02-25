# == Schema Information
#
# Table name: plantphotos
#
#  id         :integer          not null, primary key
#  caption    :string
#  cover      :boolean
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  plant_id   :integer
#
class Plantphoto < ApplicationRecord
end
