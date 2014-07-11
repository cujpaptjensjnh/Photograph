class FollowersController < ApplicationController
	def create
		params[:follower][:following_id] = current_user.id
		@follower = Follower.new(params[:follower])
		if @follower.save
			redirect_to uploaded_user_profile_path(@follower.followee_id)
		end
	end
	def destroy
		# @user_profile = UserProfile.find(params[:is_followed_by_current_user][:followee_id])
		@follower = Follower.find(params[:id])
		# @user_profile = UserProfile.find(@follower.followee_id)
		@user_profile = @follower.followee.user_profile
		@follower.destroy
		redirect_to uploaded_user_profile_path(@user_profile)
	end
end
