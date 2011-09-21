class ApplicationsController < ApplicationController
  require 'digest/md5'
  
  before_filter :load_application
  filter_access_to :all, :attribute_check => true
  
  # GET /applications
  def index
    @applications = Application.all

    respond_to do |format|
      format.html
    end
  end

  # GET /applications/app_name
  def show
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

  # GET /applications/app_name/edit
  def edit
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

  # PUT /applications/app_name
  def update
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

  # DELETE /applications/app_name
  def destroy
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
    end
  end
  
  private
  
  def generate_api_key(application)
    Digest::MD5.hexdigest(application.name + application.hostname + Time.now.to_i.to_s)
  end
  
  def load_application
    @application = Application.find_by_name(params[:id])
  end
end
