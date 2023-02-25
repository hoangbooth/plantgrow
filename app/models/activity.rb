# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  care_at    :datetime
#  care_type  :string
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  plant_id   :integer
#
class Activity < ApplicationRecord
end
