class ProjectPhotosController < ApplicationController
  def index
    @project_photo = policy_scope(ProjectPhoto)
  end

  def new
    @project_photo = ProjectPhoto.new
    authorize @photo
  end

  def show
    @project_photo = ProjectPhoto.find(params[:id])
    authorize @project_photo
  end

  def create
    @project_photo = ProjectPhoto.new(project_photo_params)
    @project = Project.find(params[:project_id])
    @project_photo.project = @project
    authorize @project_photo
    if @project_photo.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    @project_photo = ProjectPhoto.find(params[:id])
    authorize @project_photo
  end

  def destroy
    @project_photo = ProjectPhoto.find(params[:id])
    authorize @project_photo
    @project_photo.destroy
    redirect_to edit_project_path(@project_photo.project)
  end

  private

  def project_photo_params
    params.require(:project_photo).permit(:photo)
  end
end
