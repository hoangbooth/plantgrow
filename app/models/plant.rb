# == Schema Information
#
# Table name: plants
#
#  id                :integer          not null, primary key
#  activities_count  :integer
#  dead              :boolean
#  likes_count       :integer
#  name              :string
#  plantphotos_count :integer
#  water_interval    :integer
#  water_next_at     :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :integer
#  room_id           :integer
#  species_id        :integer
#
class Plant < ApplicationRecord
end
