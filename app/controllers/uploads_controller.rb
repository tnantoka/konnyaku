class UploadsController < ApplicationController

  before_action :sign_in_required, except: [:index]
  before_action :set_upload, only: [:destroy]
  before_action :load_uploads, only: [:index]

  def index
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to :uploads, notice: I18n.t('flash.models.create', model: Upload.model_name.human)
    else
      load_uploads
      render :index
    end
  end

  def destroy
    @upload.destroy
    redirect_to :uploads, notice: I18n.t('flash.models.destroy', model: Upload.model_name.human) 
  end

private
  def set_upload
    @upload = Upload.find(params[:id])
  end

  def upload_params
    return nil if params[:upload].blank?
    params.require(:upload).permit(:file)
  end

  def load_uploads
    @uploads = Upload.index.page(params[:p]).per(@settings.post.pagination.admin)
  end

end

