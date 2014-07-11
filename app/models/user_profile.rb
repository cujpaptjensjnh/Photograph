class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :avatar, :birthday, :description, :firstname, :gender, :job, :lastname, :user_id
  mount_uploader :avatar, AvatarUploader
  has_many :comment_walls
  # has_many :user_comment_walls, through: :comment_walls, source: :user
end
