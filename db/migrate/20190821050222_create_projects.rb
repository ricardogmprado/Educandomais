class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :teacher, foreign_key: true
      t.string :title
      t.string :description
      t.string :material
      t.integer :quantity
      t.integer :average_unit_price
      t.string :category
      t.string :school_year
      t.date :limit_date

      t.timestamps
    end
  end
end
