class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
  end

  def create
    @project = Project.find(params[:project_id])
    @donation = Donation.new(donation_params)
    @donation.project = @project
    @user = current_donator
    @donation.donator = @user
    # raise
    if @donation.save
      redirect_to project_path(@project)
    else render :new
    end
  end

  def update
    if @donation.update(donation_params)
      redirect_to project_path(@project), notice: 'A doação foi atualizada'
    else
      render :edit
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @donation = Donation.find(params[:id])
    @donation.project = @project
    @user = current_teacher
    @project.teacher = @user
  end

  private

  def donation_params
    params.require(:donation).permit(:status, :quantity_donated)
  end
end
