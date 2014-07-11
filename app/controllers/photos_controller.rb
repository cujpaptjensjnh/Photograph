class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :all]
  # GET /photos
  # GET /photos.json
  def index
    # @photos = Photo.all
    # @photos = Photo.search_by_name(params[:photo_name]).paginate(:page => params[:page])
    # @photos = Photo.search_by_name(params[:search]).page(params[:page])
    @photos = Photo.search_by_name(params[:search])
    if @photos.class == Array
      @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(20)
    else
      @photos = @photos.page(params[:page]).per(20)
    end

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @photos }
    # end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @category = Category.find(@photo.category_id)
    @photos = Photo.related_photo(@category.id, @photo.id)
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @photo }
    # end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @photo }
    # end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    params[:photo][:user_id] = current_user.id
    @photo = Photo.new(params[:photo])

    if @photo.save
        redirect_to photos_path, notice: 'Photo was successfully created.'
    else
      render "new"
    end

    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
    #     format.json { render json: @photo, status: :created, location: @photo }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @photo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def all
    @photo = Photo.first
    @category = Category.find(@photo.category_id)
    @photos = Photo.all
    if @photos.class == Array
      @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(20)
    else
      @photos = @photos.page(params[:page]).per(20)
    end
  end
end
