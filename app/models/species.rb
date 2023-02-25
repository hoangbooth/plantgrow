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

  has_many(:plants, { :class_name => "Plant", :foreign_key => "species_id" })
  validates(:nickname, { :presence => { :message => "can't be blank" } })
  validates(:cover, { :presence => true })
  validates(:binoname, { :presence => { :message => "can't be blank" } })
  validates(:binoname, { :uniqueness => { :message => "has already been taken" } })

end
