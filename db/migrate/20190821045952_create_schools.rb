class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.string :neighbourhood
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
