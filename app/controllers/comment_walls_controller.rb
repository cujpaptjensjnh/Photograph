class CommentWallsController < ApplicationController
	before_filter :authenticate_user!

	def create
		params[:comment_wall][:user_id] = current_user.id
		@user_profile = UserProfile.find(params[:comment_wall][:user_profile_id])
		@comment_wall = CommentWall.new(params[:comment_wall])
		if @comment_wall.save
			redirect_to wall_user_profile_path(@user_profile)
		end
	end
end
