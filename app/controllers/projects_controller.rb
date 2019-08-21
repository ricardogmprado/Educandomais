class ProjetosController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  def index
    @project = Project.all
    # @projetos = policy_scope(project)
  end

  def show
    # authorize @project
  end

  def new
    @project = Project.new
    # authorize @project
  end

  def create
    @project = project.new(projeto_params)
    # authorize @project
    # @project.user = current_user

    if @project.save
      redirect_to project_path(@project), notice: 'Seu projeto foi criado'
    else
      render :new
    end
  end

  def update
    # authorize @project
    if project.update(projeto_params)
      redirect_to project_path(@project), notice: 'Seu projeto foi atualizado'
    else
      render :edit
    end
  end

  def edit
    # authorize @project
  end

  private

  def set_projeto
    @project = project.find(params[:id])
  end

  def projeto_params
    params.require(:project).permit(:title, :description, :material, :quantity, :average_unit_price, :category, :limit_date, :school_year)
  end
end
