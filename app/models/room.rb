# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  roomname   :string
#  roomtype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Room < ApplicationRecord

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })
  has_many(:plants, { :class_name => "Plant", :foreign_key => "room_id" })

  

end
