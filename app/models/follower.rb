class Follower < ActiveRecord::Base
	belongs_to :user
  belongs_to :following, :class_name => "User"
  belongs_to :followee, :class_name => "User"
  attr_accessible :followee_id, :following_id

 #  attr_accessible :student_id, :teacher_id, :user_id
 #  belongs_to :user
 #  belongs_to :teacher, :class_name => "User"
 #  belongs_to :student, :class_name => "User"

 	def self.is_followed_by_current_user(following_id, followee_id)
  	Follower.where(['following_id = ? and followee_id = ?', following_id, followee_id])
  end
end
