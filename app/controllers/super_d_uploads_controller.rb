class SuperDUploadsController < ApplicationController
  before_action :set_super_d_upload, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /super_d_uploads
  # GET /super_d_uploads.json
  def index
    @super_d_uploads = SuperDUpload.all
  end

  # GET /super_d_uploads/1
  # GET /super_d_uploads/1.json
  def show
  end

  # GET /super_d_uploads/new
  def new
    @super_d_uploads = SuperDUpload.all
    @super_d_upload = current_user.super_d_uploads.build
  end

  # GET /super_d_uploads/1/edit
  def edit
  end

  # POST /super_d_uploads
  # POST /super_d_uploads.json
  def create
    @super_d_upload = current_user.super_d_uploads.build(super_d_upload_params)

    respond_to do |format|
      if @super_d_upload.save
        format.html { redirect_to @super_d_upload, notice: 'Super d upload was successfully created.' }
        format.json { render :new, status: :created, location: @super_d_upload }
      else
        format.html { render :new }
        format.json { render json: @super_d_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_d_uploads/1
  # PATCH/PUT /super_d_uploads/1.json
  def update
    respond_to do |format|
      if @super_d_upload.update(super_d_upload_params)
        format.html { redirect_to @super_d_upload, notice: 'Super d upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_d_upload }
      else
        format.html { render :edit }
        format.json { render json: @super_d_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_d_uploads/1
  # DELETE /super_d_uploads/1.json
  def destroy
    @super_d_upload.destroy
    respond_to do |format|
      format.html { redirect_to super_d_uploads_url, notice: 'Super d upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_d_upload
      @super_d_upload = SuperDUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_d_upload_params
      params.require(:super_d_upload).permit(:title, :body, :imgfile, :created_at)
    end
end

