class CommentsController < ApplicationController
  before_filter :authenticate_person! 

  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
    @photo = Photo.find(params[:photo_id])
    @album = @photo.album

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    @album = @photo.album
  end

  # POST /comments
  # POST /comments.xml
  def create
    @photo = Photo.find(params[:photo_id])
    @album = @photo.album
    @comment = Comment.new(params[:comment])
    @comment.photo = @photo
    @comment.person = Person.find(current_person.id)
    @comments = @photo.comments.paginate(:page => params[:page], :per_page => 5)
    @last_page = ((@comments.total_pages<1)? 1: @comments.total_pages)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(album_photo_path(@album, @photo, :page => @last_page), :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    @album = @photo.album

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(album_photo_path(@album, @photo), :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    @album = @photo.album
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(album_photo_path(@album, @photo), :notice => 'Comment was successfully deleted.') }
    end
  end
end
