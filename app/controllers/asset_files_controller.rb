class AssetFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_asset_file, only: [:show, :edit, :update, :destroy]

  # GET /asset_files
  # GET /asset_files.json
  def index
    @asset_files = current_user.asset_files
  end

  # GET /asset_files/1
  # GET /asset_files/1.json
  def show
    @asset_file = current_user.asset_files.find(params[:id]) 
  end

  # GET /asset_files/new
  def new
    @asset_file = current_user.asset_files.build
    if params[:folder_id]
     @current_folder = current_user.folders.find(params[:folder_id]) 
     @asset_file.folder_id = @current_folder.id 
    end
  end

  # GET /asset_files/1/edit
  def edit
    @asset_file = current_user.asset_files.find(params[:id]) 
  end

  # POST /asset_files
  # POST /asset_files.json
  def create
    @asset_file = current_user.asset_files.build(asset_file_params) 

    respond_to do |format|
      if @asset_file.save
        flash[:notice] = "File was successfully uploaded."
        format.html do
          if @asset_file.folder
            redirect_to browse_path(@asset_file.folder)
          else
            redirect_to root_url 
          end
        end
        format.json { render :show, status: :created, location: @asset_file }
      else
        format.html { render :new }
        format.json { render json: @asset_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_files/1
  # PATCH/PUT /asset_files/1.json
  def update
    @asset_file = current_user.asset_files.find(params[:id]) 

    respond_to do |format|
      if @asset_file.update(asset_file_params)
        format.html { redirect_to @asset_file, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_file }
      else
        format.html { render :edit }
        format.json { render json: @asset_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_files/1
  # DELETE /asset_files/1.json
  def destroy
    @asset_file = current_user.asset_files.find(params[:id]) 
    @parent_folder = @asset_file.folder
    @asset_file.destroy
    flash[:notice] = "File was successfully deleted."

    if @parent_folder
     redirect_to browse_path(@parent_folder) 
    else
     redirect_to root_url 
    end
  end

  def get 
    asset = current_user.asset_files.find_by_id(params[:id]) 
    if asset 
      send_file asset.uploaded_file.path,
        type: asset.uploaded_file_content_type
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_file
      @asset_file = AssetFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_file_params
      params.require(:asset_file).permit(:user_id, :uploaded_file, :folder_id)
    end
end
