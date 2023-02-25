# == Schema Information
#
# Table name: species
#
#  id           :integer          not null, primary key
#  about        :string
#  binoname     :string
#  cover        :string
#  difficulty   :string
#  instruction  :string
#  location     :string
#  nickname     :string
#  pet_friendly :boolean
#  sun_type     :string
#  water_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Species < ApplicationRecord
end
