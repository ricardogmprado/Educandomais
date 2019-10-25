class AddTotalDonationsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :total_donations, :integer
  end
end
