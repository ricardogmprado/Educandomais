class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!, only: [:create, :new, :update, :edit]
  def index
    # @projects = Project.all
    @projects = policy_scope(Project)
    # raise

    if params[:keyword].present?
      @projects = @projects.where("title ILIKE?", "%#{params[:keyword]}%")
    end

    if params[:category].present?
      @projects = @projects.where(category: params[:category])
    end

    # raise
  end

  def show
    authorize @project
    # raise
  end

  def new
    @project = Project.new
    authorize @project
    # raise
  end

  def create
    @project = Project.new(project_params)
    @project.teacher = current_teacher
    # raise
    authorize @project
      if params[:project_photos].nil?
      else
      save_photos
      end
      # raise
    @project.teacher.id = current_teacher.id
    # raise
    if @project.save
      # raise
      redirect_to project_path(@project), notice: 'Seu projeto foi criado'
    else
      render 'projects/show'
    end
    # # raise
  end

  def update
    # raise
    # @project.teacher = @teacher
    authorize @project
      if params[:project_photos].nil?
      else
      save_photos
      end
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Seu projeto foi atualizado'
    else
      render :edit
    end
  end

  def edit
    # @project.teacher = @teacher
    authorize @project
  end


  def destroy
    authorize @project
    @project.destroy
    redirect_to projects_path, notice: 'Seu projeto foi deletado com sucesso'
  end
  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :material, :quantity, :average_unit_price, :category, :limit_date, project_photos: [])
  end

  def save_photos
    # raise
      params[:project_photos].each do |photo|
      project_photo = ProjectPhoto.new
      project_photo.photo = photo
      @project.project_photos << project_photo
      project_photo.save
    end
  end
end
