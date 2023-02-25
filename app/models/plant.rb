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

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id", :counter_cache => :own_plants_count })
  belongs_to(:species, { :required => true, :class_name => "Species", :foreign_key => "species_id" })
  has_many(:likes, { :class_name => "Like", :foreign_key => "plant_id", :dependent => :destroy })
  has_many(:plantphotos, { :class_name => "Plantphoto", :foreign_key => "plant_id", :dependent => :destroy })
  has_many(:activities, { :class_name => "Activity", :foreign_key => "plant_id", :dependent => :destroy })
  belongs_to(:room, { :class_name => "Room", :foreign_key => "room_id" })

  has_many(:fans, { :through => :likes, :source => :fan })
  has_many(:followers, { :through => :owner, :source => :following })
  has_many(:fan_followers, { :through => :fans, :source => :following })



end
