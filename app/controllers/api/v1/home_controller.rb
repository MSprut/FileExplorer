class Api::V1::HomeController < ApplicationController

	def index
		@folders = Folder.all
    @asset_files = AssetFile.all
    render json: { folders: @folders, asset_files: @asset_files}, status: :ok
	end

	def browse 
    @current_folder = current_user.folders.find(params[:folder_id])   
  
    if @current_folder
      @folders = @current_folder.children
      @asset_files = @current_folder.asset_files.order("uploaded_file_file_name desc")
      render json: @asset_files, status: :ok
    else
      flash[:error] = "It's not your folders!"
      render json: 'No folder matched'
    end
	end
end
