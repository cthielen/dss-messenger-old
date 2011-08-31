class TemplatesController < ApplicationController
  # GET /templates
  def index
    @templates = Template.all

    respond_to do |format|
      format.html
    end
  end

  # GET /templates/1
  def show
    @template = Template.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @template }
    end
  end

  # GET /templates/new
  def new
    @template = Template.new

    respond_to do |format|
      format.html
    end
  end

  # GET /templates/1/edit
  def edit
    @template = Template.find(params[:id])
  end

  # POST /templates
  def create
    @template = Template.new(params[:template])

    respond_to do |format|
      if @template.save
        format.html { redirect_to(@template, :notice => 'Template was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /templates/1
  def update
    @template = Template.find(params[:id])

    respond_to do |format|
      if @template.update_attributes(params[:template])
        format.html { redirect_to(@template, :notice => 'Template was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /templates/1
  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to(templates_url) }
    end
  end
end
