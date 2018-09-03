class FoldersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_folder, only: [:show, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = current_user.folders
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = current_user.folders.find(params[:id])
  end

  # GET /folders/new
  def new
    @folder = current_user.folders.new     

   if params[:folder_id]
     @current_folder = current_user.folders.find(params[:folder_id]) 
     @folder.parent_id = @current_folder.id 
   end
  end

  # GET /folders/1/edit
  def edit
    @folder = current_user.folders.find(params[:folder_id]) 
    @current_folder = @folder.parent
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.new(folder_params)

    respond_to do |format|
      if @folder.save
        flash[:notice] = "Folder was successfully created."
        format.html do
          if @folder.parent 
            redirect_to browse_path(@folder.parent)
          else
            redirect_to root_url
          end
        end
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    @folder = current_user.folders.find(params[:id])
    respond_to do |format|
      if @folder.update(folder_params)
        flash[:notice] = "Folder was successfully updated."
        format.html do
          if @folder.parent
            redirect_to browse_path(@folder.parent)
          else
            redirect_to root_url
          end
        end
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = current_user.folders.find(params[:id]) 
    @parent_folder = @folder.parent
    
    @folder.destroy 
    flash[:notice] = "Folder and all the contents inside was successfully deleted."
    
    if @parent_folder
      redirect_to browse_path(@parent_folder) 
    else
      redirect_to root_url       
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id, :user_id)
    end
end
