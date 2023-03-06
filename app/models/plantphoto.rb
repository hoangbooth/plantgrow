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

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id", :counter_cache => true })
  belongs_to(:plant, { :required => true, :class_name => "Plant", :foreign_key => "plant_id", :counter_cache => true })

  mount_uploader :image, ImageUploader

  
  
end
