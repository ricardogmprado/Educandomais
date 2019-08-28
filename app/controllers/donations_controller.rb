class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @project = Project.find(params[:project_id])
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donator = Donator.find(params[:donator_id])
    @project.donator = @donator
    if @donation.save
      redirect_to project_path(@project)
    else render :new
    end
  end

  def update
  end

  def edit
    @project = Project.find(params[:project_id])
    # @donation = Donation.find(params[:id])

  end

  private

  def donation_params
    params.require(:donation).permit(:status, :quantity_donated)
  end
end
