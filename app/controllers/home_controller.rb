class HomeController < ApplicationController

	def index
		@folders = current_user.folders.roots  
    @asset_files = current_user.asset_files.where("folder_id is NULL").order("uploaded_file_file_name desc")       
	end

	def browse 
    @current_folder = current_user.folders.find(params[:folder_id])   
  
    if @current_folder
      @folders = @current_folder.children
      @asset_files = @current_folder.asset_files.order("uploaded_file_file_name desc") 
      render :action => "index"
    else
      flash[:error] = "It's not your folders!"
      redirect_to root_url 
    end
	end
end
