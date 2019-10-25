class ChangeTotalDonationsProject < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :total_donations, :integer, :default => 0
  end
end
