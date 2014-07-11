class UserProfilesController < ApplicationController
  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
    if user_signed_in?
      @user_profile = UserProfile.where(['user_id = ?', current_user.id])
    end

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @user_profiles }
    # end
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    @user_profile = UserProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/new
  # GET /user_profiles/new.json
  def new
    @user_profile = UserProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/1/edit
  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    params[:user_profile][:user_id] = current_user.id
    @user_profile = UserProfile.new(params[:user_profile])

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render json: @user_profile, status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.json
  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      redirect_to @user_profile
    else
      render action: "edit"
    end

    # respond_to do |format|
    #   if @user_profile.update_attributes(params[:user_profile])
    #     format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @user_profile.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end

  def uploaded
    @user_profile = UserProfile.find(params[:id])

    if user_signed_in?
      @is_followed_by_current_user = Follower.is_followed_by_current_user(current_user.id, @user_profile.user_id)
      @follower = Follower.new
    end

    @photos = @user_profile.user.photos
    if @photos.class == Array
      @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(18)
    else
      @photos = @photos.page(params[:page]).per(18)
    end
  end

  def wall
    @user_profile = UserProfile.find(params[:id])

    if user_signed_in?
      @is_followed_by_current_user = Follower.is_followed_by_current_user(current_user.id, @user_profile.user_id)
      @follower = Follower.new
    end
    @comment_wall = CommentWall.new
    # @comment_walls = CommentWall.list_comment_walls_by_user_profile(@user_profile.user_id)
    @comments = @user_profile.comment_walls
    if @comments.class == Array
      @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(4)
    else
      @comments = @photos.page(params[:page]).per(4)
    end
  end
end
