class UploadsController < ApplicationController
  respond_to :html, :json
  
  def index
    @uploads = Upload.all
    
    respond_with(@uploads)
  end
  
  def show
    @upload = Upload.find(params[:id])
    respond_with(@upload)
  end
  
  def new
    @upload = Upload.new
    respond_with(@upload)
  end
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def create
    @upload = Upload.new(params[:student])
    flash[:notice] = "Upload was successfully created." if @upload.save
    respond_with(@upload, :location => uploads_path)      
  end
  
  def destroy
    @upload = Upload.find(params[:id])
    flash[:notice] = "Upload was successfully removed." if @upload.destroy
    respond_with(nil, :location => uploads_path)
  end
end
