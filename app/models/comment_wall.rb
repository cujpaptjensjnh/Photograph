class CommentWall < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_profile
  attr_accessible :body, :user_id, :user_profile_id

  def self.list_comment_walls_by_user_profile(user_profile_id)
  	Comment.where(['user_profile_id = ?', user_profile_id])
  end
end
