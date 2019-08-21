class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :project, foreign_key: true
      t.references :donator, foreign_key: true
      t.integer :quantity_donated
      t.string :status
      t.string :status

      t.timestamps
    end
  end
end
