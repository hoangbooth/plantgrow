# == Schema Information
#
# Table name: users
#
#  id                             :integer          not null, primary key
#  activities_count               :integer
#  bio                            :string
#  city                           :string
#  email                          :string
#  name                           :string
#  own_plants_count               :integer
#  password_digest                :string
#  plantphotos_count              :integer
#  private                        :boolean
#  profilepic                     :string
#  received_follow_requests_count :integer
#  sent_follow_requests_count     :integer
#  username                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
