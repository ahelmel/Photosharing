class PhotosController < ApplicationController
  before_filter :authenticate_person! 

  # GET /photos
  # GET /photos.xml
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
    @person = Person.find(@photo.person.id)
    @comments = @photo.comments.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
    @person = Person.find(current_person.id)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
    @person = Person.find(@photo.person.id)
  end

  # POST /photos
  # POST /photos.xml
  def create
  	@album = Album.find(params[:album_id])
    @photo = Photo.new(params[:photo])
    @photo.album = @album
    @photo.person = Person.find(current_person.id)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to(album_photo_path(@album, @photo), :notice => 'Photo was successfully created.') }
      else
        format.html { render :action => "new" }
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
      else
        format.html { render :action => "edit" }
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
      format.html { redirect_to(album_photos_path(@album), :notice => 'Photo was successfully deleted.') }
    end
  end
end
