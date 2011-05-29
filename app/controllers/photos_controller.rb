class PhotosController < ApplicationController
  before_filter :authenticate_person! 

  # GET /photos
  # GET /photos.xml
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
  end

  # POST /photos
  # POST /photos.xml
  def create
  	@album = Album.find(params[:album_id])
    @photo = Photo.new(params[:photo])
    @photo.album = @album

    respond_to do |format|
      if @photo.save
        format.html { redirect_to(album_photo_path(@album, @photo), :notice => 'Photo was successfully created.') }
        #format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(album_photo_path(@album, @photo), :notice => 'Photo was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(album_photos_path(@album)) }
      #format.xml  { head :ok }
    end
  end
end
