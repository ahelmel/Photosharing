class SperrensController < ApplicationController
  # GET /sperrens
  # GET /sperrens.xml
  def index
    @sperrens = Sperren.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sperrens }
    end
  end

  # GET /sperrens/1
  # GET /sperrens/1.xml
  def show
    @sperren = Sperren.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sperren }
    end
  end

  # GET /sperrens/new
  # GET /sperrens/new.xml
  def new
    @sperren = Sperren.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sperren }
    end
  end

  # GET /sperrens/1/edit
  def edit
    @sperren = Sperren.find(params[:id])
  end

  # POST /sperrens
  # POST /sperrens.xml
  def create
    @sperren = Sperren.new(params[:sperren])

    respond_to do |format|
      if @sperren.save
        format.html { redirect_to(@sperren, :notice => 'Sperren was successfully created.') }
        format.xml  { render :xml => @sperren, :status => :created, :location => @sperren }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sperren.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sperrens/1
  # PUT /sperrens/1.xml
  def update
    @sperren = Sperren.find(params[:id])

    respond_to do |format|
      if @sperren.update_attributes(params[:sperren])
        format.html { redirect_to(@sperren, :notice => 'Sperren was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sperren.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sperrens/1
  # DELETE /sperrens/1.xml
  def destroy
    @sperren = Sperren.find(params[:id])
    @sperren.destroy

    respond_to do |format|
      format.html { redirect_to(sperrens_url) }
      format.xml  { head :ok }
    end
  end
end
