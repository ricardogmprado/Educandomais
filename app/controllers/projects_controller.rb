class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  def index
    @projects = Project.all
    # @projetos = policy_scope(project)
  end

  def show
    # authorize @project
    # raise
  end

  def new
    @project = Project.new
    # authorize @project
  end

  def create
    @project = Project.new(project_params)
    @user = current_teacher
    @project.teacher = @user
    # authorize @project

    if @project.save
      redirect_to project_path(@project), notice: 'Seu projeto foi criado'
    else
      render :new
    end
    # # raise
  end

  def update
    # authorize @project
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Seu projeto foi atualizado'
    else
      render :edit
    end
  end

  def edit
    # authorize @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :material, :quantity, :average_unit_price, :category, :limit_date, :school_year)
  end
end
