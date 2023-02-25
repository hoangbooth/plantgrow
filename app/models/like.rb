# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  plant_id   :integer
#
class Like < ApplicationRecord

  belongs_to(:fan, { :required => true, :class_name => "User", :foreign_key => "fan_id" })
  belongs_to(:plant, { :required => true, :class_name => "Plant", :foreign_key => "plant_id", :counter_cache => true })

  validates(:plant_id, { :uniqueness => { :scope => ["fan_id"] } })

end
