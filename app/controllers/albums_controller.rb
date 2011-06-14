class AlbumsController < ApplicationController
  before_filter :authenticate_person! 

  # GET /albums
  # GET /albums.xml
  def index
    @albums = Album.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])
    @pages = ((1.0+Album.count)/5.0).ceil
    @last_page = (@pages<1)? 1: @pages

    respond_to do |format|
      if @album.save
        format.html { redirect_to(albums_url(:page => @last_page), :notice => 'Album was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(albums_url, :notice => 'Album was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url, :notice => 'Album was successfully deleted.') }
      #format.html { redirect_to(albums_url) }
    end
  end
end
