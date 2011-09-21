class ApplicationsController < ApplicationController
  require 'digest/md5'
  
  filter_resource_access
  
  # GET /applications
  def index
    @applications = Application.all

    respond_to do |format|
      format.html
    end
  end

  # GET /applications/1
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /applications/new
  def new
    @application = Application.new

    respond_to do |format|
      format.html
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  def create
    @application = Application.new(params[:application])

    @application.api_key = generate_api_key(@application)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /applications/1
  def update
    @application = Application.find(params[:id])

    if params[:delete]
      @application.destroy
      respond_to do |format|
        format.html { redirect_to(applications_url, :notice => 'Application was successfully removed.') }
      end
    else
      respond_to do |format|
        if @application.update_attributes(params[:application])
          if params[:reset]
            @application.api_key = generate_api_key(@application)
            @application.save
            format.html { redirect_to @application, notice: 'API key was successfully updated.' }
          else
            format.html { redirect_to @application, notice: 'Application was successfully updated.' }
          end
        else
          format.html { render action: "edit" }
        end
      end
    end
  end

  # DELETE /applications/1
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
    end
  end
  
  private
  
  def generate_api_key(application)
    Digest::MD5.hexdigest(application.name + application.hostname + Time.now.to_i.to_s)
  end
end
