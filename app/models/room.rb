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
end
