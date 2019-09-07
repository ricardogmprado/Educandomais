class DonationsController < ApplicationController
  before_action :authenticate_donator!, only: [:create, :new]
  before_action :authenticate_teacher!, only: [:edit, :update]


  def index
    # @donations = Donation.all
    @donations = policy_scope(Donation)
  end

  def show
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
    authorize @donation
  end

  def create
    @project = Project.find(params[:project_id])
    @donation = Donation.new(donation_params)
    @donation.project = @project
    @user = current_donator
    @donation.donator = @user
    authorize @donation
    if @donation.save
      redirect_to project_path(@project)
    # raise
    else render :new
    end
  end

  def update
    @donation = Donation.find(params[:id])
    authorize @donation
    if @donation.update(donation_params)
      redirect_to project_path(@donation.project), notice: 'A doação foi atualizada'
    else
      render :edit
    end
    # raise
  end

  def edit
    # raise
    @donation = Donation.find(params[:id])
    @project = Project.find(params[:project_id])
    @donation.project = @project
    @project.teacher = current_teacher
    authorize @donation
  end

  private

  def donation_params
    params.require(:donation).permit(:status, :quantity_donated)
  end
end
