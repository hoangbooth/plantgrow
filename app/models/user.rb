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

  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })

  has_many(:own_plants, { :class_name => "Plant", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:rooms, { :class_name => "Room", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:likes, { :class_name => "Like", :foreign_key => "fan_id", :dependent => :destroy })

  has_many(:plantphotos, { :class_name => "Plantphoto", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:activities, { :class_name => "Activity", :foreign_key => "owner_id", :dependent => :destroy })


  has_many(:following, { :through => :sent_follow_requests, :source => :recipient })
  has_many(:followers, { :through => :received_follow_requests, :source => :sender })
  has_many(:liked_plants, { :through => :likes, :source => :plant })
  has_many(:feed, { :through => :following, :source => :own_plants })
  has_many(:activity, { :through => :following, :source => :liked_plants })


  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })
  
  mount_uploader :profilepic, ProfilepicUploader

end
